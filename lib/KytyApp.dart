import 'package:flutter/material.dart';

import 'OnBoarding/LoginView.dart';

class KytyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(title: "Kyty",
    routes: {
      '/loginview' : (context) => LoginView(),
      //  '/registerview' : (context) => RegisterView(),
      //  '/homeview' : (context) => HomeView(),
      //  '/splashview' : (context) => SplashView(),
    },
      initialRoute: '/loginview',
    );

    return materialApp;

  }
}