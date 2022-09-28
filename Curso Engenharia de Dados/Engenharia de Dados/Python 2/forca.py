# Started developing in Python 1, but will be finished in Python 2
def jogar_forca():
    print("*******************************")
    print('   Bem vindo no jogo de Forca')
    print("*******************************")

    palavra_secreta = 'banana'.lower()
    letras_acertadas = ['_', '_', '_', '_', '_', '_']

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