import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'KytyApp.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  KytyApp kytyApp = KytyApp();
  runApp(kytyApp);

}