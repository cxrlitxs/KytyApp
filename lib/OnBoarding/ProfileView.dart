import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kytyapp//OnBoarding/LoginView.dart';

import '../Services//KTTextField.dart';

class HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    this._context=context;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
          shadowColor: Colors.pink,
          backgroundColor: Colors.deepOrange,
        ),
        body:
        ConstrainedBox(constraints: BoxConstraints(
          minWidth: 500,
          minHeight: 700,
          maxWidth: 1000,
          maxHeight: 900,
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              KTTextField(tecController: tecNombre,sHint: "Nombre",),
              KTTextField(tecController: tecEdad,sHint: "Edad"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: onClickAceptar, child: Text("Aceptar"),),
                    TextButton( onPressed: onClickCencelar, child: Text("Cancelar"),)
                  ]
              )
            ],
          ),)
    );

}