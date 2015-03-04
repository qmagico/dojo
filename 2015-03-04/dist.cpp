#include <iostream>
#include <cmath>
#include <cassert>
#include <vector>
#include <algorithm>

using namespace std;

double calc_distancia(pair<double, double> amigo1,
					  pair<double, double> amigo2) {
	double x2 = amigo2.first,
		   x1 = amigo1.first;
    double y2 = amigo2.second,
		   y1 = amigo1.second;
	return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}

int ordena(pair<int, double> v1, pair<int, double> v2){
	return v1.first >= v2.first;
}

vector<vector<int> > achar_amigo_mais_proximo(vector<pair<double, double> > amigos){
	vector<pair<double, int> > v;
	vector<vector<int> > meus_amigos_mais_prox;
	for (int i = 0; i < amigos.size(); ++i) {
		for (int j = 0; j < amigos.size(); ++j){
			if (i != j){
				double dist = calc_distancia(amigos[i], amigos[j]);
				v.push_back( make_pair(dist, j));
			}
		}
		sort(v.begin(), v.end(), ordena);
		vector<int> id_amg = {v[0].second, v[1].second, v[2].second};

		meus_amigos_mais_prox.push_back(id_amg);
		v.clear();
	}

	return meus_amigos_mais_prox;
}

void test_calc_distancia() {
	double resultado = calc_distancia({3, 0}, {0, 4});
	assert(resultado == 5);
}

void print_vector(vector<vector<int> > resultado, vector<pair<double, double> > v){
	for (int i = 0; i < resultado.size(); ++i)
    {
    	cout << i << "[" << v[i].first << "," << v[i].second << "] ---> ";

    	for (int j = 0; j < resultado[i].size(); ++j)
    	{
    		cout << resultado[i][j] << "[" << v[j].first << "," << v[j].second << "] | ";
    	}

    	cout << endl;
    }

}

int main(){
    test_calc_distancia();

	vector<pair<double, double> > v = {
		{17, 323},
	    {221, 42},
	    {242,12},
	    {47,42}
	};

	// quando chamamos a funcao amigo mais proximo

    vector<vector<int> > resultado = achar_amigo_mais_proximo(v);
    print_vector(resultado, v);
	return 0;
}