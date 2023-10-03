import 'package:flutter/material.dart';
import 'package:kytyapp/Main/HomeView.dart';
//import 'package:kytyapp/Splash/SplashView.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/RegisterView.dart';
//import 'OnBoarding/PerfilView.dart';

class KytyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(title: "Kyty",
    routes: {
      '/loginview' : (context) => LoginView(),
      '/registerview' : (context) => RegisterView(),
      '/homeview' : (context) => HomeView(),
      //  '/profileview' : (context) => ProfileView(),
      //  '/splashview' : (context) => SplashView(),
    },
      initialRoute: '/loginview',
    );

    return materialApp;

  }
}