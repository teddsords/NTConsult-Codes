from airflow.plugins_manager import AirflowPlugin
from datapipeline.plugins.operators.twitter_operator import TwitterOperator

class AluraAirflowPlugin(AirflowPlugin):
    name= "Alura"
    operators= [TwitterOperator]