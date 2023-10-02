import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/KytyTextField.dart';

class LoginView extends StatelessWidget{

  //Methods & Variables

  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;
  TextEditingController tecUsername=TextEditingController();
  TextEditingController tecPassword=TextEditingController();

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registerview");
  }


  void onClickAceptar() async{

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tecUsername.text,
          password: tecPassword.text
      );

      print("CORRECT LOGIN");

      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> datos = await db.collection(
          "users").doc(uid).get();
      if (datos.exists) {
        print("EL NOMBRE DEL USUARIO LOGEADO ES: " + datos.data()?["name"]);
        print("LA EDAD DEL USUARIO LOGEADO ES: " +
            datos.data()!["age"].toString());
        print("LA ALTURA DEL USUARIO LOGEADO ES: " +
            datos.data()!["tall"].toString());
        Navigator.of(_context).popAndPushNamed("/homeview");
      }

      else {
        Navigator.of(_context).popAndPushNamed("/profileview");
      }
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _context=context;

    Column columna = Column(children: [
      Text("Bienvenido al login de Kyty",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: KytyTextField(tecController: tecUsername,
            sHint:'Escribe tu correo'),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: KytyTextField(tecController: tecPassword,
            sHint:'Escribe tu contraseña',
            blIsPassword: true),
      ),

      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: onClickAceptar, child: Text("ACEPTAR"),),
          TextButton( onPressed: onClickRegistrar, child: Text("REGISTRARSE"),)
        ],)


    ],);


    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.pink,
      backgroundColor: Colors.greenAccent,
    );

    Scaffold scaf = Scaffold(body: columna,
      //backgroundColor: Colors.deepOrange,
      appBar: appBar,);

    return scaf;

  }
}