class Graph {
  var maxVertices;
  List<List<int>> matrix;

  dijkistra(int start) {
    List<int> distance;
    List<int> padre;
    List<bool> visto;
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
        if (matrix[u][i] != 0) {
          if (distance[i] > distance[u] + matrix[u][i]) {
            distance[i] = distance[u] + matrix[u][i];
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
