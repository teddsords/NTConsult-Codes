from airflow.models import DAG
from datapipeline.airflow.plugins.alura import TwitterOperator
from datetime import datetime
from os.path import join

with DAG(dag_id= "twitter_dag", start_date= datetime.now()) as dag:
    twitter_operator = TwitterOperator(
        task_id= 'twitter_aluraonline',
        query='aluraOnline',
        file_path= join(
            "/home/teddy/NTConsult-Codes/Curso Engenharia de Dados/Engenharia de Dados/Getting to know Apache Airflow/datapipeline/datalake", # Criando diretorio
            "twitter_aluraonline",  # Tabela dentro do nosso "data lake"
            "extract_date={{ ds }}",    # Partição dentro da tabela com a data de extração
            "AluraOnline_{{ ds_nodash}}.json"
        )
    )