class Graph {
  int maxVertices = 8;
  List<List<int>> adjacentMatrix;
  List<List<int>> weightMatrix;
  List<List<int>> cities;
  Graph(){
    

  }
  //Lista de convenciones
  // A = Oviedo
  // B = Bilbao
  // C = Madrid
  // D = Sevilla
  // E = Alicante
  // F = Barcelona
  // G = Malaga
  // H = Melilla

  //Matriz de adyacencia
  //  A  B  C  D  E  F  G  H
  //A[0][0][1][0][0][0][0][0]
  //B[0][0][1][0][0][1][0][0]
  //C[1][1][0][1][1][1][1][0]
  //D[0][0][1][0][0][0][1][0]
  //E[0][0][1][0][0][1][0][0]
  //F[0][1][1][0][1][0][1][0]
  //G[0][0][1][1][0][1][0][1]
  //H[0][0][0][0][0][0][1][0]

  //Matriz de pesos
  //  A     B   C   D    E    F    G   H
  //A[0][0][445][0][0][0][0][0]
  //B[0][0][395][0][0][606][0][0]
  //C[445][395][0][531][437][622][534][0]
  //D[0][0][531][0][0][0][207][0]
  //E[0][0][437][0][0][538][0][0]
  //F[0][606][622][0][538][0][1006][0]
  //G[0][0][534][207][0][1006][0][221]
  //H[0][0][0][0][0][0][221][0]

  void fillMatrix () {


  }

  dijkistra(int start) {
    List<int> distance = new List (maxVertices);
    List<int> padre = new List (maxVertices);
    List<bool> visto ;
    for (int i = 0; i < maxVertices; i++) {
      distance[i] = 1200000000;
      padre[i] = -1;
      visto[i] = false;
    }
    distance[start] = 0;
    List<int> pila;
    pila.add(distance[start]);
    while (pila.length != 0) {
      int u = pila[0];
      pila.remove(0);
      visto[u] = true;
      for (int i = 0; i < maxVertices; i++) {
        if (adjacentMatrix[u][i] != 0) {
          if (distance[i] > distance[u] + adjacentMatrix[u][i]) {
            distance[i] = distance[u] + adjacentMatrix[u][i];
            padre[i] = u;
            pila.add(i);
            pila.sort();
          }
        }
      }
    }
    return distance;
  }
}
