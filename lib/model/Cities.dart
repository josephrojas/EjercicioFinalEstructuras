class Cities {
  var _id;
  var _name;

  Cities(var id, var name) {
    _id = id;
    _name = name;
  }

  getId() => _id;

  getName() => _name;

  setId(var id) => _id = id;

  setName(var name) => _name = name;

  static List<Cities> getCities() {
    return <Cities>[
      Cities(0, "--Seleccione una ciudad--"),
      Cities(1, "Oviedo"),
      Cities(2, "Bilbao"),
      Cities(3, "Madrid"),
      Cities(4, "Alicante"),
      Cities(5, "Barcelona"),
      Cities(6, "Malaga"),
      Cities(7, "Melilla"),
      Cities(8, "Sevilla"),
    ];
  }
}
