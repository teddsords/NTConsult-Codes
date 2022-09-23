# Jogo de Adivinação criado para o curso de Python: começando com a linguagem da Alura
from random import randrange

def jogar_adivinacao():
    print("*******************************")
    print('Bem vindo no jogo de Adininação')
    print("*******************************")

    numero_secreto = randrange(1, 101)
    pontos = 1000
    print(numero_secreto)

    print("Qual o nivel de dificuldade?")
    print("1- Facil\n2- Medio\n3- Dificil")
    nivel = int(input("Escolha o nivel:"))

    if nivel == 1:
        tentativas = 20
    elif nivel == 2:
        tentativas = 10
    else:
        tentativas = 5

    for rodada in range(1,tentativas + 1):
        print(f"Tentativa: {rodada} de {tentativas}")
        chute = int(input("Digite um numero entre 1 e 100: "))
        print("Voce digitou:", chute)

        if chute < 1 or chute > 100:
            print("Voce deve digitar um numero entre 1 e 100!")
            continue

        if numero_secreto == chute:
            print(f"Voce acertou e fez {pontos}!")
            break
        else:
            if chute > numero_secreto:
                print("Errou!! O seu chute foi maior que o numero secreto")
            elif chute < numero_secreto:
                print("Errou!! O seu chute foi menor que o numero secreto")
            
            pontos_perdidos = abs(numero_secreto - chute)
            pontos -= pontos_perdidos

            if(rodada == tentativas):
                print(f"O numero secreto era: {numero_secreto}")
        
    print("Fim do jogo")   

if __name__ == '__main__':
    jogar_adivinacao()