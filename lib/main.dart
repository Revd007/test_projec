import 'package:flutter/material.dart';
import 'package:test_project/Splash/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
      theme : ThemeData(
          primarySwatch : Colors.blue
      ),
      home : SplashScreen()
  ));
}