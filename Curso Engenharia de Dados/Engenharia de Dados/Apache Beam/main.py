import apache_beam as beam
from apache_beam.io import ReadFromText
from apache_beam.options.pipeline_options import PipelineOptions
import re

def texto_para_lista(elemento, delimitador="|"):
    """
    Recebe uma texto e um separador
    Retorna uma lista com a string separada
    """

    return elemento.split(delimitador)

def lista_para_dicionario(elemento, colunas):
    """
    Recebe duas listas (uma com os valores e outra com as chaves)
    Retorna um dicionário
    """
    return dict(zip(colunas, elemento))

def trata_data(elemento):
    """
    Recebe um dicionario e cria um novo campo ANO-MES
    Retorno o mesmo dicionario com o novo campo
    """
    elemento['ano_mes'] = '-'.join(elemento['data_iniSE'].split('-')[:2])
    return elemento

def chave_uf(elemento):
    """
    Receber um dicionario
    Retornar uma tupla com o estado (UF) e o elemento(dicionario) virando assim ->(UF, dicionario)
    """
    chave= elemento['uf']
    return (chave, elemento)

def casos_dengue(elemento):
    """
    Recebe uma tupla ('UF', [{}, {}])
    Retornar uma tupla ('UF-ANO-MES', casos)
    """
    uf, registros = elemento    # A variavel UF recebe a chave UF e a variavel registros recebe a lista de dicionarios
    for registro in registros:
        if bool(re.search(r'\d', registro['casos'])):
            yield(f"{uf}-{registro['ano_mes']}", float(registro['casos']))
        else:
            yield(f"{uf}-{registro['ano_mes']}", 0.0)

pipeline_options = PipelineOptions(argv= None)   # Para receber as opções da Pipeline a ser utilizada
pipeline= beam.Pipeline(options= pipeline_options)  # Criada a pipeline recebendo as opções anteriormente definidas
colunas_dengue = [  'id',
                    'data_iniSE',
                    'casos',
                    'ibge_code',
                    'cidade',
                    'uf',
                    'cep',
                    'latitude',
                    'longitude']

dengue = (
    pipeline
    | 'Leitura do dataset de dengue' >> 
        ReadFromText('casos_dengue.txt', skip_header_lines=1)
    | 'De texto para lista' >>
        beam.Map(texto_para_lista)
    | 'De lista para dicionario' >>
        beam.Map(lista_para_dicionario, colunas_dengue)
    | 'Criar campo ano_mes' >>
        beam.Map(trata_data)
    | 'Criar chave pelo estado' >>
        beam.Map(chave_uf)
    | 'Agrupar pelo estado' >>
        beam.GroupByKey()
    | 'Descompactar casos de dengue' >>
        beam.FlatMap(casos_dengue)
    | 'Soma dos casos pela chave' >>
        beam.CombinePerKey(sum)
    | 'Mostrar resultados' >> 
        beam.Map(print)
)

pipeline.run()