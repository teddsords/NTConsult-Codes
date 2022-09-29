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

def pede_chute():
    chute = str.strip(input('Qual letra?\nDigite:')).lower()
    return chute  

def marca_chute_correto(chute, letras_acertadas, palavra_secreta):
    index = 0
    for letra in palavra_secreta:
                if chute == letra:
                    letras_acertadas[index] = letra.lower()
                index += 1 

def imprime_mensagem_ganhador():
    print("Parabéns, você ganhou!")
    print("       ___________      ")
    print("      '._==_==_=_.'     ")
    print("      .-\\:      /-.    ")
    print("     | (|:.     |) |    ")
    print("      '-|:.     |-'     ")
    print("        \\::.    /      ")
    print("         '::. .'        ")
    print("           ) (          ")
    print("         _.' '._        ")
    print("        '-------'       ")

def imprime_mensagem_perdedor(palavra_secreta):
    print("Puxa, você foi enforcado!")
    print("A palavra era {}".format(palavra_secreta))
    print("    _______________         ")
    print("   /               \       ")
    print("  /                 \      ")
    print("//                   \/\  ")
    print("\|   XXXX     XXXX   | /   ")
    print(" |   XXXX     XXXX   |/     ")
    print(" |   XXX       XXX   |      ")
    print(" |                   |      ")
    print(" \__      XXX      __/     ")
    print("   |\     XXX     /|       ")
    print("   | |           | |        ")
    print("   | I I I I I I I |        ")
    print("   |  I I I I I I  |        ")
    print("   \_             _/       ")
    print("     \_         _/         ")
    print("       \_______/           ")

def desenha_forca(erros):
    print("  _______     ")
    print(" |/      |    ")

    if(erros == 1):
        print(" |      (_)   ")
        print(" |            ")
        print(" |            ")
        print(" |            ")

    if(erros == 2):
        print(" |      (_)   ")
        print(" |      \     ")
        print(" |            ")
        print(" |            ")

    if(erros == 3):
        print(" |      (_)   ")
        print(" |      \|    ")
        print(" |            ")
        print(" |            ")

    if(erros == 4):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |            ")
        print(" |            ")

    if(erros == 5):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |            ")

    if(erros == 6):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      /     ")

    if (erros == 7):
        print(" |      (_)   ")
        print(" |      \|/   ")
        print(" |       |    ")
        print(" |      / \   ")

    print(" |            ")
    print("_|___         ")
    print()

def jogar_forca():
    
    imprime_mensagem_abertura()

    palavra_secreta = carrega_palavra_secreta()

    
    letras_acertadas = ['_' for letra in palavra_secreta]
    print(letras_acertadas)

    enforcou = False
    acertou = False
    erros = 0

    while (not enforcou and not acertou):
        chute = pede_chute()

        if chute in palavra_secreta:
            marca_chute_correto(chute, letras_acertadas, palavra_secreta)
        else:
            erros += 1
            desenha_forca(erros)
        
        enforcou = erros == 7   # Se erros for igual a 6, ele fara que enforcou seja igual a True
        acertou = '_' not in letras_acertadas   # Se ha underscores dentro de letras acertadas, sera False
        print(letras_acertadas)    

    if acertou:
        imprime_mensagem_ganhador()
    else:
        imprime_mensagem_perdedor(palavra_secreta)
    
    print('Fim do jogo')

if __name__ == '__main__':
    jogar_forca()