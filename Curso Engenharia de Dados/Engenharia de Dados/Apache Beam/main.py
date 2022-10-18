import apache_beam as beam
from apache_beam.io import ReadFromText
from apache_beam.options.pipeline_options import PipelineOptions

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
    | 'Mostrar resultados' >> beam.Map(print)
)

pipeline.run()