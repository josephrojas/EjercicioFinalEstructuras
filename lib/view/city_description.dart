import 'dart:math';

import 'package:final_proyect_data_strucures/view/fade_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GraphPage.dart';

class CityDescription extends StatefulWidget {
  @override
  _CityDescriptionState createState() => _CityDescriptionState();
}

class _CityDescriptionState extends State<CityDescription>
    with TickerProviderStateMixin {
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
      body: Stack(children: [
        Positioned(
          left: 90,
          child: FadeOut(
            3,
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(rotationController),
              child: InkWell(
                onTap: () {
                  rotationController.forward(from: 0.0);
                  Future.delayed(const Duration(milliseconds: 700), () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GraphPage()),
                      );
                    });
                  });
                },
                child: Image(image: AssetImage("assets/img/pointers.png")),
              ),
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              FadeOut(
                2,Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage("assets/img/volver.png"),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    InkWell(
                      child: Image(
                        image: AssetImage("assets/img/logo.png"),
                        width: 183,
                        height: 145,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FadeOut(
                    2.5,Column(
                      children: [
                        Text(
                          "Madrid",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "€ 300 Euros",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FadeOut(
                3,Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/img/barcelona.jpg")),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: 363,
                  height: 226,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeOut(
                4,Text(
                  "Madrid, Spain's central capital, is a city of elegant boulevards and expansive, manicured parks such as the Buen Retiro. It’s renowned for its rich repositories of European art, including the Prado Museum’s works by Goya, Velázquez and other Spanish masters",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  rotationController.forward(from: 0.0);
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GraphPage()),
                      );
                    });
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeOut(4,Text("Continuar a Barcelona")),
                    FadeOut(
                      2,Image(
                        image: AssetImage("assets/img/arrow_right.png"),
                        width: 68,
                        height: 68,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
