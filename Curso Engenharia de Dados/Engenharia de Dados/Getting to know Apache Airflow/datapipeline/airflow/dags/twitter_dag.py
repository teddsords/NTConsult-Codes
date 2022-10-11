from airflow.models import DAG
from datapipeline.airflow.plugins.alura import TwitterOperator
from datetime import datetime
from os.path import join
from airflow.contrib.operators.spark_submit_operator import SparkSubmitOperator
from airflow.utils.dates import days_ago

ARGS= {
    'owner': 'airflow',
    "depends_on_past": False,
    'start_date': days_ago(6)
}
TIMESTAMP_FORMAT= '%Y-%m-%dT%H:%M:%S.00Z'
with DAG(
    dag_id= "twitter_dag",
    default_args= ARGS,
    schedule_interval= '0 9 * * *',
    max_active_runs= 1

) as dag:
    twitter_operator = TwitterOperator(
        task_id= 'twitter_aluraonline',
        query='aluraOnline',
        file_path= join(
            "/home/teddy/NTConsult-Codes/Curso Engenharia de Dados/Engenharia de Dados/Getting to know Apache Airflow/datapipeline/datalake", # Criando diretorio
            "twitter_aluraonline",  # Tabela dentro do nosso "data lake"
            "extract_date={{ ds }}",    # Partição dentro da tabela com a data de extração
            "AluraOnline_{{ ds_nodash}}.json"
        ),
        start_time=(
            '{{'
            f"execution_date.strftime('{ TIMESTAMP_FORMAT }')"
            '}}'
        ),
        end_time=(
            '{{'
            f"next_execution_date.strftime('{ TIMESTAMP_FORMAT }')"
            '}}'
        )
    )

    twitter_transform = SparkSubmitOperator(
        task_id= 'transform_twitter_aluraonline',
        application= 'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Engenharia de Dados\Getting to know Apache Airflow\datapipeline\spark\\transformation.py',
        name= 'twitter_transformation',
        application_args= [
            '--src',
            'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Engenharia de Dados\Getting to know Apache Airflow\datapipeline\datalake\\bronze\\twitter_aluraonline\extrac_date=2022-10-06',
            '--dest',
            'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Engenharia de Dados\Getting to know Apache Airflow\datapipeline\datalake\silver\\twitter_aluraonline',
            '--process-date',
            '{{ ds }}'
        ]
    )

    twitter_operator >> twitter_transform   # Connecting twitter_operator to twitter_transform. Both of them are operators.