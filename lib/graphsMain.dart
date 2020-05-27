import 'package:flutter/material.dart';
import 'GraphPage.dart';

class GraphsMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grafo del recorrido",
      theme: ThemeData(
        primaryColor: Colors.white
      ),
        home: GraphPage(),
    );
  }
}