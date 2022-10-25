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

def chave_uf_ano_mes_de_lista(elemento):
    """
    Receber uma lista de elementos
    Retornar uma tupla com chave uf-ano-mes e o valor de chuva em mm
    ('UD-ANO-MES', 1.3)
    """
    data, chuva, uf = elemento
    ano_mes = '-'.join(data.split('-')[:2])
    chave = f'{uf}-{ano_mes}'

    if float(chuva) < 0:
        chuva = 0.0
    else:
        chuva = float(chuva)

    return chave, chuva

def arredonda(elemento):
    """
    Recebe uma tupla ('PA-2019-06', 2364.0000000000003)
    Retorna uma tupla com o valor arredondado ('PA-2019-06', 2364.0)
    """
    chave, chuva = elemento
    return (chave, round(chuva,1))

def filtra_campos_vazios(elemento):
    """
    Remove elementos que tenham chaves vazias
    Receber uma tupla ('CE-2015-04', {'chuvas': [55.0], 'dengue': [680.0]})
    Retorna uma tupla sem chaves/campos vazios
    """

    chave, dados = elemento
    if all([dados['chuvas'],dados['dengue']]):
        return True
    return False

def descompactar_elementos(elemento):
    """
    Receber uma tupla ('CE-2015-12', {'chuvas': [7.6], 'dengue': [29.0]})
    Retornar uma tupla ('CE', '2015', 12', '7.6', '29.0')
    """
    chave, dados = elemento
    chuva = dados['chuvas'][0]
    dengue = dados['dengue'][0]
    uf, ano, mes = chave.split('-')

    return uf, ano, mes, str(chuva), str(dengue)

def preparar_csv(elemento, delimitador= ';'):
    """
    Receber uma tupla ('CE', 2015, 12, 7.6, 29.0)
    Retornar uma string delimitada "'CE';2015;12;7.6;29.0"
    """
    return f'{delimitador}'.join(elemento)

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
        ReadFromText('sample_casos_dengue.txt', skip_header_lines=1)
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
    #| 'Mostrar resultados' >> 
     #  beam.Map(print)
)

chuvas = (
    pipeline
    | 'Leitura do dataset de chuvas' >> 
        ReadFromText('sample_chuvas.csv', skip_header_lines=1)
    | 'De texto para lista (chuva)' >>
        beam.Map(texto_para_lista, delimitador= ',')
    | 'Criando chave UF-YY-MM' >>
        beam.Map(chave_uf_ano_mes_de_lista)
    | 'Soma das chuvas pela chave' >>
        beam.CombinePerKey(sum)
    | 'Arredondar resultados de chuvas' >>
        beam.Map(arredonda)
    #| 'Mostrar resultados de chuvas' >> 
     #  beam.Map(print)
)

resultado = (
    #(chuvas, dengue)    # Recebendo as duas pcollections
    #| "Empilha as pcolls" >>
    #    beam.Flatten()    # Unindo as pcollections recebidas
    #| 'Agrupamento por chave' >>
    #    beam.GroupByKey()   # Juntando pelas chaves
    ({'chuvas': chuvas, 'dengue': dengue})
    | 'Mesclar pcolls' >>
        beam.CoGroupByKey()
    | 'Filtrar dados vazios' >>
        beam.Filter(filtra_campos_vazios)
    | 'Descompactar elementos' >>
        beam.Map(descompactar_elementos)
    | 'Preparar csv' >>
        beam.Map(preparar_csv)
    | 'Mostrar resultados da uniao' >> 
        beam.Map(print)
    
)

pipeline.run()