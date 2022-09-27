# Developed in Python 1 course

from forca import jogar_forca
from guess_numbers import jogar_adivinacao

print("*******************************")
print('     Escolha o seu jogo')
print("*******************************")

print('1- Forca\n2- Adivinacao')
jogo = int(input('Qual jogo voce deseja jogar? '))

if jogo == 1:
    print('Jogando Forca!')
    jogar_forca()
elif jogo == 2:
    print('Jogando Adivinacao')
    jogar_adivinacao()