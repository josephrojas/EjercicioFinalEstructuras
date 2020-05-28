import 'package:final_proyect_data_strucures/view/fade_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> with TickerProviderStateMixin {


  AnimationController rotationController;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              FadeOut(
                3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image(
                          image: AssetImage("assets/img/volver.png"),
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/img/logo.png"),
                            width: 183,
                            height: 145,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              FadeOut(
                3.5,Text(
                  "El camino más corto a tu ruta\n es el siguiente",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              FadeOut(
                4.5,
                Container(
                  height: 500,
                  alignment: Alignment.centerLeft,
                  child: Transform.rotate(
                    angle: 200,
                    child: CustomPaint(
                      size: Size(70, 100),
                      painter: Node(),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
    var text = "Hola";
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
