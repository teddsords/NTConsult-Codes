# Started developing in Python 1, but will be finished in Python 2
def jogar_forca():
    print("*******************************")
    print('   Bem vindo no jogo de Forca')
    print("*******************************")

    palavra_secreta = 'python'

    enforcou = False
    acertou = False

    while (not enforcou and not acertou):
        chute = str.strip(input('Qual letra?\nDigite:'))
        index = 0

        for letra in palavra_secreta:
            if chute.lower() == letra.lower():
                print(f'Encontrei a letra {letra} na posicao {index}\n')
            
            index += 1



    print('Fim do jogo')

if __name__ == '__main__':
    jogar_forca()