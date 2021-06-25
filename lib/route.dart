

import 'package:karmas/pages/homepage.dart';

import 'package:karmas/pages/loginpage.dart';
import 'package:karmas/pages/profile.dart';
import 'package:karmas/pages/splashscreen.dart';

const String SplashScreenRoute = '/splash';
const String LoginPageRoute = '/login';
const String HomePageRoute = '/home';
const String ProfilePageRoute = '/profile';

final routes = {
  SplashScreenRoute: (context) => SplashScreen(),
  LoginPageRoute: (context) => LoginPage(),
  HomePageRoute: (context) => HomePage(),
  ProfilePageRoute: (context) => ProfilePage(),
 
};