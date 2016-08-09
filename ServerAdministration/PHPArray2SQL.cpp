#include <iostream>
#include <vector>
using namespace std;

// PHP Array to SQL
// José Ballester, 23 Dec 2014
// Pre: PHP Array of the following form:
//		0 => "a", 1 => "b" ...
//		inserted in order 0, 1, ..., N, 0, 1, ..., N multiple times
// Post: SQL insert command with IDs and columns' contents:
//		 ('0', 'a', 'a2', 'a3', 'a4'), ('1', 'b', 'b2', 'b3', 'b4'), ... (supposing 4 columns)

int main() {
	int a;
	vector <vector <vector <string> > > V (1000);
	vector <int> N (1000, -1);
	while(cin >> a) {
		N[a]++;
		V[a].push_back(vector <string> (0));
		char b;
		cin >> b >> b;
		string w;
		while(cin >> w) {
			string w3 = w;
			if(w[0] == '\"') {
				string w2;
				for(int s = 1; s < w.size(); s++) {
					w2.push_back(w[s]);
				}
				w = w2;
			}
			if(w.size() > 2 and w[w.size()-2] == '\"' and w[w.size()-1] == ',') {
				string w2;
				for(int s = 0; s < w.size()-2; s++) {
					w2.push_back(w[s]);
				}
				w = w2;
			}
			V[a][N[a]].push_back(w);
			if(w3[w3.size()-2] == '\"' and w3[w3.size()-1] == ',') break;
		}
	}
	for(int i = 0; i < V.size(); i++) {
		if(V[i].size() > 0) cout << "(\'" << i << "\', ";
		for(int j = 0; j < V[i].size(); j++) {
			cout << "\'";
			for(int k = 0; k < V[i][j].size(); k++) {
				if(k != 0) cout << " ";
				cout << V[i][j][k];
			}
			cout << "\'";
			if(j != V[i].size()-1) cout << ",";
		}
		if(V[i].size() > 0) cout << "),";
		cout << endl;
	}
}
