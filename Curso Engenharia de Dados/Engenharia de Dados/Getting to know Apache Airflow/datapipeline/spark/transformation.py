from pyspark.sql import SparkSession

if __name__ == '__main__':
    spark = SparkSession.builder.appName('twitter_transformation').getOrCreate()

    df = spark.read.json(
        r'D:\OneDrive - NTCONSULT\NTConsult-Codes\Curso Engenharia de Dados\Engenharia de Dados\Getting to know Apache Airflow\datapipeline\datalake\twitter_aluraonline\extrac_date=2022-10-06\AluraOnline_20221006.json'
    )

    df.printSchema()
    df.show()