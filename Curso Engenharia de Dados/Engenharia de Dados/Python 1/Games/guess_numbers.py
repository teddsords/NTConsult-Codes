# Jogo de Adivinação criado para o curso de Python: começando com a linguagem da Alura
print("*******************************")
print('Bem vindo no jogo de Adininação')
print("*******************************")

numero_secreto = 43
tentativas = 3

for rodada in range(1,tentativas + 1):
    print(f"Tentativa: {rodada} de {tentativas}")
    chute = int(input("Digite o seu numero: "))
    print("Voce digitou:", chute)

    if numero_secreto == chute:
        print("Voce acertou!")
        break
    else:
        if chute > numero_secreto:
            print("Errou!! O seu chute foi maior que o numero secreto")
        elif chute < numero_secreto:
            print("Errou!! O seu chute foi menor que o numero secreto")
    
print("Fim do jogo")   