import sys 
sys.path.append("/home/teddy/NTConsult-Codes/Curso Engenharia de Dados/Engenharia de Dados/Getting to know Apache Airflow/datapipeline/airflow/plugins")
from airflow.models import BaseOperator, DAG, TaskInstance
from airflow.utils.decorators import apply_defaults
from hooks.twitter_hook import TwitterHook
import json
from datetime import datetime

class TwitterOperator(BaseOperator):

    # Aplicando os defaults
    @apply_defaults
    # query, conn_id, start_time e end_time sao informacoes que vem do gancho e serão utilizadas aqui pelo operador
    def __init__(
        self,
        query,
        conn_id = None,
        start_time= None,
        end_time = None,
        *args, **kwargs
    ):
       
        super().__init__(*args, **kwargs)   # Inicializando a classe pai 
        self.query = query      # Recebendo os valores recebidos na iniciação da classe
        self.conn_id = conn_id
        self.start_time = start_time
        self.end_time = end_time


    # Função para executar o hook por meio do operador
    def execute(self, context):
        hook = TwitterHook(
            query = self.query,
            conn_id = self.conn_id, 
            start_time = self.start_time, 
            end_time = self.end_time
        )

        # Ainda dentro da função, fazemos o for para poder imprimir o retorno da função run() do hook!!!
        for pg in hook.run():
            print(json.dumps(pg, indent= 4, sort_keys= True))

if __name__ == '__main__':
    # Instânciando uma DAG para fazer uso do operador.
    with DAG(dag_id='TwitterTest',start_date= datetime.now()) as dag:       
        to = TwitterOperator(query= 'AluraOnline', task_id='test_run')  # Declarando o operador propriemente dito
        ti = TaskInstance(task= to)     # Declarando uma task instance

        to.execute(ti.task_id)      # Finalmente executando o operador com o id da task.