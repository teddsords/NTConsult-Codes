# Jogo de Adivinação criado para o curso de Python: começando com a linguagem da Alura
print("*******************************")
print('Bem vindo no jogo de Adininação')
print("*******************************")

numero_secreto = 43

chute = int(input("Digite o seu numero: "))

print("Voce digitou:", chute)

if numero_secreto == chute:
    print("Voce acertou!")
else:
    print("Voce errou!")