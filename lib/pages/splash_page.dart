import 'dart:async';

import 'package:flutter/material.dart';
import 'package:molekola/main.dart';
import 'package:molekola/pages/authentication_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _routeToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AuthenticationPage()));
  }

  @override
  Widget build(BuildContext context) {
    //////////// Timer ////////////
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      timer.cancel();
      _routeToLogin();
    });
    /////////// Timer ////////////

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          ),
          Image(
            image: AssetImage('assets/images/molekola-logo.png'),
            width: 200,
          )
        ],
      ),
    ));
  }
}
