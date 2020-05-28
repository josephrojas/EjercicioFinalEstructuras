
class Graph {
  var maxVertices;
  List<List<int>> matrix;

 dijkistra(int start) {
   List<List<int>> distance;
   List<List<int>> padre;
   List<List<int>> visto;
    for (int i = 0; i < maxVertices; i++) {
      distance[i] = 1200000000;
      padre[i] = -1;
      visto[i] = false;
    }
    distance[start]=0;
    PriorityQueue([int comparison()])=HeapPriorityQueue <E>;
    pila.add(distance[start]);
    while (!pila.isEmpty()) {
      int u = pila.poll();
      visto[u] = true;
      for (int i = 0; i < maxVertices; i++) {
        if (matrix[u][i] != 0) {
          if (distance[i] > distance[u] + matrix[u][i]) {
            distance[i] = distance[u] + matrix[u][i];
            padre[i] = u;
            pila.add(i);
          }
        }
      }
    }
    return distance;
  }
}
