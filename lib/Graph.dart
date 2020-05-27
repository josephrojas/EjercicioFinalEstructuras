class Graph {
  var _id;
  var _name;

  Graph(var id, var name) {
    _id = id;
    _name = name;
  }

  getId() => _id;

  getName() => _name;

  setId(var id) => _id = id;

  setName(var name) => _name = name;
}
