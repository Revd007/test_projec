import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_project/Auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initLoading();
    super.initState();
  }

  void initLoading() async {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("splash_screen.jpeg"),
                    fit: BoxFit.cover)),
            child: SizedBox()
      )
    );
  }
}
