# -*- coding: utf-8 -*-
import sys

def ler_linhas():
	for linha in sys.stdin.readlines()[1:]:
		coordenadas = map(int , linha.split())
		pontos_x = coordenadas[::2]
		pontos_y = coordenadas[1::2]
		pontos = zip(pontos_x, pontos_y)
		x_y = coordenadas[-2:]
		robo_dentro_de_quadrado(pontos, x_y)

def robo_dentro_de_quadrado(pontos, x_y):
	x, y = x_y

	pontos_x = [p[0] for p in pontos]
	pontos_y = [p[1] for p in pontos]

	menor_x = min(pontos_x)
	maior_x = max(pontos_x)

	menor_y = min(pontos_y)
	maior_y = max(pontos_y)

	if x > menor_x and x < maior_x and y > menor_y and y < maior_y:
		print 1
	else:
		print 0

if __name__ == '__main__':
	ler_linhas()



