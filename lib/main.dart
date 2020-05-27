import 'package:flutter/material.dart';

import 'second.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image(
              width: 183.0,
              height: 145.0,
              image: AssetImage('assets/img/logo.png'),
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              child: Text("Ingresar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Principal()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
