import 'package:flutter/material.dart';
import 'package:project1/SplashScreen.dart';
// import 'package:project1/Page1.dart';
import 'package:project1/register.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
