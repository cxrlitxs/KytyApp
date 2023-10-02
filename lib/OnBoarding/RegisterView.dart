import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/KytyTextField.dart';

class RegisterView extends StatelessWidget{

  //Methods & Variables

  late BuildContext _context;

  TextEditingController tecUsername=TextEditingController();
  TextEditingController tecPassword=TextEditingController();
  TextEditingController tecRespass=TextEditingController();

  SnackBar snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  void onClickCancelar(){
    Navigator.of(_context).pushNamed("/loginview");
  }
  void onClickAceptar() async {
    //print("DEBUG>>>> "+usernameController.text);
    if(passwordController.text==respassController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );

        Navigator.of(_context).pushNamed("/loginview");

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    else{
      ScaffoldMessenger.of(_context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _context=context;

    Column columna = Column(children: [
      Text("Bienvenido al registro de Kyty",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: KytyTextField(tecController: tecUsername,
            sHint:'Escribe tu usuario'),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: KytyTextField(tecController: tecPassword,
          sHint:'Escribe tu contraseña',
          blIsPassword: true,),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: KytyTextField(tecController: tecRespass,
          sHint:'Repite tu contraseña',
          blIsPassword: true,),
      ),

      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: onClickAceptar, child: Text("ACEPTAR"),),
          TextButton( onPressed: onClickCancelar, child: Text("CANCELAR"),)
        ],)


    ],);

    AppBar appBar = AppBar(
      title: const Text('Register'),
      centerTitle: true,
      shadowColor: Colors.pink,
      backgroundColor: Colors.greenAccent,
    );

    Scaffold scaf=Scaffold(body: columna,
      //backgroundColor: Colors.deepOrange,
      appBar: appBar,);

    return scaf;

  }

}