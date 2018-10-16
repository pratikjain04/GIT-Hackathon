import 'package:flutter/material.dart';
import 'SplashScreen/splash_screen.dart';
import 'Home/HomePage.dart';
import 'SignIn/signin.dart';
import 'Home/Skills.dart';
import 'Home/CollegeSelection.dart';

void main() => runApp(MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomePage': (BuildContext context) => new HomePage(),
      '/SignIn': (BuildContext context) => new SignIn(),
      '/Skills': (BuildContext context) => new Skills(),
      '/CollegeSelection': (BuildContext context) => new CollegeSelection()

    },
));

