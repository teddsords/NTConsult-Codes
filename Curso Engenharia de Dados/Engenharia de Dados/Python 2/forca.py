# Started developing in Python 1 course, but will be finished in Python 2 course
from random import randrange

def imprime_mensagem_abertura():
    print("*******************************")
    print('   Bem vindo no jogo de Forca')
    print("*******************************")

def carrega_palavra_secreta():
    arquivo = open('palavras.txt', 'r')
    palavras = []
    for linha in arquivo:
        palavras.append(linha.strip().lower())
    
    arquivo.close()
    numero = randrange(0, len(palavras))
    palavra_secreta = palavras[numero]

    return palavra_secreta


def jogar_forca():
    
    imprime_mensagem_abertura()

    palavra_secreta = carrega_palavra_secreta()

    
    letras_acertadas = ['_' for letra in palavra_secreta]
    
    enforcou = False
    acertou = False
    erros = 0

    print(letras_acertadas)
    while (not enforcou and not acertou):
        chute = str.strip(input('Qual letra?\nDigite:')).lower()
        index = 0

        if chute in palavra_secreta:
            for letra in palavra_secreta:
                if chute == letra:
                    letras_acertadas[index] = letra.lower()
                index += 1
        else:
            erros += 1
        
        enforcou = erros == 6   # Se erros for igual a 6, ele fara que enforcou seja igual a True
        acertou = '_' not in letras_acertadas   # Se ha underscores dentro de letras acertadas, sera False
        print(letras_acertadas)    

    if acertou:
        print('Voce ganhou!')
    else:
        print('Voce perdeu!')
    print('Fim do jogo')

if __name__ == '__main__':
    jogar_forca()