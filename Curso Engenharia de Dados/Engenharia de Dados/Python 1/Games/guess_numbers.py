# Jogo de Adivinação criado para o curso de Python: começando com a linguagem da Alura
print("*******************************")
print('Bem vindo no jogo de Adininação')
print("*******************************")

numero_secreto = 43
tentativas = 3
rodada = 1
while rodada <= tentativas:
    print("Tentativa:", rodada, "de", tentativas)
    chute = int(input("Digite o seu numero: "))
    print("Voce digitou:", chute)

    if numero_secreto == chute:
        print("Voce acertou!")
    else:
        if chute > numero_secreto:
            print("Errou!! O seu chute foi maior que o numero secreto")
        elif chute < numero_secreto:
            print("Errou!! O seu chute foi menor que o numero secreto")
    
    rodada += 1

print("Fim do jogo")   