import 'package:final_proyect_data_strucures/view/second.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
