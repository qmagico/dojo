#coding: utf-8

import unittest

def mic(mictorios):
	l = [0]* len(mictorios)
	soma = list(mictorios)

	def _verifica(valor1, valor2, valor3 = 0):
		return not valor1 + valor2 + valor3

	def _atualiza (index):
		l[index], soma[index] = 1, 1
	
	for i , element in enumerate(mictorios):
		if i == len(mictorios) -1:
			if _verifica(soma[i-1],soma[i]):
				_atualiza(i)
		elif i == 0:
			if _verifica(soma[i+1], soma[i]):
				_atualiza(i)
		else:
			if _verifica(soma[i+1], soma[i], soma[i-1]):
				_atualiza(i)
	return l


class Test(unittest.TestCase):

	def test_1(self):
		self.assertEqual(uma_linha([0, 0, 0]), [1, 0, 1])

	def test_2(self):
		self.assertEqual(uma_linha([0, 1, 0]), [0, 0, 0])

	def test_3(self):
		self.assertEqual(uma_linha([1, 0, 0]), [0, 0, 1])
	
	def test_4(self):
		self.assertEqual(uma_linha([1, 0, 0, 1]), [0, 0, 0, 0])
	
	def test_5(self):
		self.assertEqual(uma_linha([1, 1, 0, 0, 1]), [0, 0, 0, 0, 0])

	def test_6(self):
		self.assertEqual(uma_linha([1, 1, 1]), [0, 0, 0])

	def test_7(self):
		self.assertEqual(uma_linha([1, 0, 0, 0, 0, 1, 0]), [0, 0, 1, 0, 0, 0, 0])

	def test_8(self):
		self.assertEqual(uma_linha([0]), [1])

	def test_9(self):
		self.assertEqual(uma_linha([1]), [0])

	def test_10(self):
		self.assertEqual(uma_linha([1, 0]), [0, 0])

	def test_11(self):
		self.assertEqual(uma_linha([0, 1]), [0, 0])

	def test_12(self):
		self.assertEqual(uma_linha([0, 0]), [1, 0])

	def test_13(self):
		self.assertEqual(uma_linha([0, 0, 1]), [1, 0, 0])


if __name__ == '__main__':
	unittest.main()
