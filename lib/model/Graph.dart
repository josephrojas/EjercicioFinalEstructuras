class Graph {
  int maxVertices;
  List<List<int>> adjacentMatrix;
  List<List<int>> weightMatrix;
  List<int> distance;
  List<bool> visto;
  //List<Cities> cities;
  Graph() {
    maxVertices = 8;
    adjacentMatrix = new List<List<int>>(maxVertices);
    weightMatrix = new List<List<int>>(maxVertices);
    distance = [];
    visto = [];
    //cities = Cities.getCities();
    fillMatrix();
  }
  //Lista de convenciones
  // A = Oviedo = 1
  // B = Bilbao = 2
  // C = Madrid = 3
  // D = Sevilla = 4
  // E = Alicante = 5
  // F = Barcelona = 6
  // G = Malaga = 7
  // H = Melilla = 8

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

  void fillMatrix() {
    for (var i = 0; i < maxVertices; i++) {
      List<int> list = new List<int>(maxVertices);

      for (var j = 0; j < maxVertices; j++) {
        list[j] = 0;
      }

      adjacentMatrix[i] = list;
      weightMatrix[i] = list;
    }
    for (int i = 0; i < maxVertices; i++) {
      distance.add(120000000);
      visto.add(false);
    }
    //A = 0;
    //B = 1;
    //C = 2;
    //D = 3;
    //E = 4;
    //weightMatrix[0][1] = 3;
    //weightMatrix[1][0] = 3;
    //weightMatrix[0][2] = 1;
    //weightMatrix[2][0] = 1;
    //weightMatrix[2][1] = 7;
    //weightMatrix[1][2] = 7;
    //weightMatrix[2][3] = 2;
    //weightMatrix[3][2] = 2;
    //weightMatrix[2][4] = 7;
    //weightMatrix[4][2] = 7;
    //weightMatrix[1][3] = 5;
    //weightMatrix[3][1] = 5;
    //weightMatrix[1][4] = 1;
    //weightMatrix[4][1] = 1;
    weightMatrix[0][2] = 445;
    weightMatrix[1][2] = 395;
    weightMatrix[1][5] = 606;
    weightMatrix[2][0] = 445;
    weightMatrix[2][1] = 395;
    weightMatrix[2][3] = 531;
    weightMatrix[2][4] = 437;
    weightMatrix[2][5] = 622;
    weightMatrix[2][6] = 534;
    weightMatrix[3][2] = 531;
    weightMatrix[3][6] = 207;
    weightMatrix[4][2] = 437;
    weightMatrix[4][5] = 538;
    weightMatrix[5][1] = 606;
    weightMatrix[5][2] = 622;
    weightMatrix[5][4] = 538;
    weightMatrix[5][6] = 1006;
    weightMatrix[6][2] = 534;
    weightMatrix[6][3] = 207;
    weightMatrix[6][5] = 1006;
    weightMatrix[6][7] = 221;
    weightMatrix[7][6] = 221;
  }

  dijkistra(int start, int end) {
    distance[start - 1] = 0;
    List<int> pila = [];
    List<int> result = [];
    pila.add(start - 1);
    while (pila.length != 0) {
      int u = pila[0];
      pila.removeAt(0);
      for (int i = 0; i < maxVertices; i++) {
        if (weightMatrix[u][i] > 0) {
          if (!visto[i]) {
            if (distance[u] + weightMatrix[u][i] < distance[i]) {
              distance[i] = distance[u] + weightMatrix[u][i];
              pila.add(i);
            }
          }
        }
      }
      visto[u] = true;
      pila.sort();
    }
    int temp = end - 1;
    result.add(temp + 1);
    while (temp != (start - 1)) {
      for (int i = 0; i < maxVertices; i++) {
        if (weightMatrix[temp][i] > 0) {
          if (distance[temp] - weightMatrix[temp][i] == distance [i]) {
            result.add(i + 1);
            temp = i;
          }
        }
      }
    }
    return result;
  }
}
