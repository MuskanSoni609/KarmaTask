import 'dart:async';

import 'package:flutter/material.dart';

import '../route.dart';
import '../shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  
  final Preferences preferences = Preferences();
   @override
    void initState() {

      super.initState();
      preferences.readCache("password").then((value) {
      if(value != null){
        return Timer(Duration(seconds : 2),
        () => Navigator.of(context).pushNamed(HomePageRoute));
      }
      else{
         return Timer(Duration(seconds : 2),
        () => Navigator.of(context).pushNamed(LoginPageRoute));
      }
      
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }
  
}