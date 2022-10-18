import apache_beam as beam
from apache_beam.io import ReadFromText
from apache_beam.options.pipeline_options import PipelineOptions

def texto_para_lista(elemento, delimitador="|"):
    """
    Recebe uma texto e um separador
    Retorna uma lista com a string separada
    """

    return elemento.split(delimitador)


pipeline_options = PipelineOptions(argv= None)   # Para receber as opções da Pipeline a ser utilizada
pipeline= beam.Pipeline(options= pipeline_options)  # Criada a pipeline recebendo as opções anteriormente definidas

dengue = (
    pipeline
    | 'Leitura do dataset de dengue' >> 
        ReadFromText('casos_dengue.txt', skip_header_lines=1)
    | 'De texto para lista' >>
        beam.Map(texto_para_lista)
    | 'Mostrar resultados' >> beam.Map(print)
)

pipeline.run()