# Started developing in Python 1, but will be finished in Python 2
def jogar_forca():
    print("*******************************")
    print('   Bem vindo no jogo de Forca')
    print("*******************************")

    palavra_secreta = 'banana'
    letras_acertadas = ['_', '_', '_', '_', '_', '_']

    enforcou = False
    acertou = False
    erros = 0

    print(letras_acertadas)
    while (not enforcou and not acertou):
        chute = str.strip(input('Qual letra?\nDigite:'))
        index = 0

        if chute in palavra_secreta:
            for letra in palavra_secreta:
                if chute.lower() == letra.lower():
                    letras_acertadas[index] = letra.lower()
                index += 1
        else:
            erros += 1
            
        print(letras_acertadas)    

    print('Fim do jogo')

if __name__ == '__main__':
    jogar_forca()