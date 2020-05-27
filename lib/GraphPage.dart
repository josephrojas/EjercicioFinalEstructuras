import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),

              margin: EdgeInsets.all(15.0),
              child: Text(
                "El camino mas corto",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),
            Row(children: <Widget>[
              Container(
                  padding: new EdgeInsets.only(top: 20.0),
                  margin: EdgeInsets.all(15.0),

                  width: MediaQuery.of(context).size.width / 2 - 48,
                  height: 500,
                  child: CustomPaint(
                    size: Size(70, 100),
                    painter: Node(),
                  )),
              Container(
                  padding: new EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 500,
                  margin: EdgeInsets.only(right: 5),
                  alignment: Alignment.topRight,
                  child: Text(
                    "El camino mas corto entre ciudad a y ciudad b es este",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ))
            ]),
            Container(
              padding: new EdgeInsets.only(
                  top: 50.0, bottom: 10.0, left: 15.0, right: 15.0),
              color: Colors.green,
              margin: EdgeInsets.only(left:15.0, right: 15.0, top:5.0),
              width: MediaQuery.of(context).size.width ,
              height: 170,
              child: Text(
              "Inserte boton aqui.",
              style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 30.0),
              textAlign: TextAlign.center,
            )
            )],
        ),
      ),
    );
  }
}

class Node extends CustomPainter {
  @override
  List<int> _caminos;

  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.black;
    var r = 25.0;
    var limit = 5;
    var rightMargen = 50.0;
    var topMargen = 70.0;
    var text="Hola";
    for (double i = 0; i < limit; i++) {
      canvas.drawOval(
          Rect.fromLTWH(rightMargen, (topMargen * i), r * 2, r * 2), paint);
      canvas.drawOval(
          Rect.fromLTWH((rightMargen + 10), ((topMargen * i) + 10),
              (r - 10) * 2, (r - 10) * 2),
          paint);
      canvas.drawLine(
          Offset(rightMargen + r, (topMargen * i + (2 * r))),
          Offset(
              rightMargen + r, (topMargen - r * 2) + (topMargen * i + (2 * r))),
          paint);
    }
    canvas.drawOval(
        Rect.fromLTWH(rightMargen, (topMargen * limit), r * 2, r * 2), paint);
    canvas.drawOval(
        Rect.fromLTWH((rightMargen + 10), ((topMargen * limit) + 10),
            (r - 10) * 2, (r - 10) * 2),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
