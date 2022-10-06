import requests
import json
from airflow.providers.http.hooks.http import HttpHook

class TwitterHook(HttpHook):

    # Inicializando a classe com os parametros de query, connection id, start time e end time
    def __init__(self, query, conn_id = None, start_time = None, end_time = None):
        self.query = query
        self.conn_id = conn_id or "twitter_API" # Caso não seja recebido um valor para conn_id será utilizado "twitter_API"
        self.start_time = start_time
        self.end_time = end_time

        super().__init__(http_conn_id = self.conn_id)

    # Função para criar a url da requisição.
    def create_url(self):
        query = self.query
        tweet_fields = "tweet.fields=author_id,conversation_id,created_at,id,in_reply_to_user_id,public_metrics,text"
        user_fields = 'expansions=author_id&user.fields=id,name,username,created_at'
        start_time = (
            f'&start_time={self.start_time}'
            if self.start_time
            else '' # Caso o valor não seja recebido, o parâmetro ficara vazio, pois ele não é obrigatório
            )

        end_time = (
            f'&end_time={self.start_time}'
            if self.end_time
            else ''  # Caso o valor não seja recebido, o parâmetro ficara vazio, pois ele não é obrigatório
            )

        # Podemos utilizar base_url nessa string pois foi recebida ao inicializar a classe com a herança de HttpHook.
        url = "{}/2/tweets/search/recent?query={}&{}&{}{}{}".format(
            self.base_url, query, tweet_fields, user_fields, start_time, end_time
        )
        return url

    # Criando a conexão ao endpoint
    def connect_to_endpoint(self, url, session):
        response = requests.Request("GET", url)
        prep = session.prepare_request(response)
        self.log.info(f'URL: {url}')
        return self.run_and_check(session, prep, {}).json() # Invocando a função herdada de run and check

    def paginate(self, url, session, next_token=''):  # next_token é uma variável não obrigatoria
        if next_token:      # Se há algum token, cria-se o novo full_url
            full_url = f'{url}&next_token={next_token}'
        else:       # Caso contrário continua-se com o recebido
            full_url = url
        data = self.connect_to_endpoint(full_url, session)
        yield data                                              # Para fazer a recursividade
        if 'next_token' in data.get('meta', {}):
            yield from self.paginate(url, session, data['meta']['next_token'])   # Se temos o next token no campo meta, vamos chamar novamente para obter a seguinte pagina

    # Função principal da classe para chamar os outro métodos    
    def run(self):
        session = self.get_conn()   # Obtendo o nome da conexão que será realizada.

        url = self.create_url()     # Chamando a função para criação do url

        yield from self.paginate(url, session)  # Obtendo resultados da paginação

if __name__ == '__main__':
    for pg in TwitterHook('AluraOnline').run():     # Inicializando a classe e como não é passado o conn_id, será utilizado twitter_API para pegar o ID dentro do Airflow
        print(json.dumps(pg, indent = 4, sort_keys=True))