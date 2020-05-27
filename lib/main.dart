import 'package:flutter/material.dart';

import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children : <Widget>[
              Image(
                width: 200.0,
                height: 200.0,
                image: AssetImage('Images/Captura.PNG'),
              ),
              RaisedButton(
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
      ),
    );
  }
}
