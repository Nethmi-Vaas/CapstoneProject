
import 'package:flutter/material.dart';
import 'package:flutter_application_2/splash_screen.dart';
//import 'package:flutter_application_2/Cowpea.dart';
//import 'package:flutter_application_2/KingCoconut.dart';
//import 'package:flutter_application_2/Brinjal.dart';
//import 'package:flutter_application_2/GreenGram.dart';
//import 'package:flutter_application_2/Avocado.dart';
//import 'package:flutter_application_2/Grapes.dart';
//import 'package:flutter_application_2/Papaya.dart';
//import 'package:flutter_application_2/Pineapple.dart';
//import 'package:flutter_application_2/Potatoes.dart';
//import 'package:flutter_application_2/Pumpkin.dart';
//import 'package:flutter_application_2/dashboard.dart';
//import 'package:flutter_application_2/leeks.dart';
//import 'package:flutter_application_2/Gchillie.dart';
//import 'package:flutter_application_2/Cabbage.dart';


//import 'package:flutter_application_2/splash_screen.dart';
//import 'package:flutter_application_2/veg1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

