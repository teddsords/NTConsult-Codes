import apache_beam as beam
from apache_beam.io import ReadFromText
from apache_beam.options.pipeline_options import PipelineOptions


pipeline_options = PipelineOptions(argv= None)   # Para receber as opções da Pipeline a ser utilizada
pipeline= beam.Pipeline(options= pipeline_options)  # Criada a pipeline recebendo as opções anteriormente definidas

dengue = (
    pipeline
    | 'Leitura do dataset de dengue' >> 
        ReadFromText('casos_dengue.txt', skip_header_lines=1)
)