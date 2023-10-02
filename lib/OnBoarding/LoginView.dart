import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _context=context;

    Column columna = Column(children: [
      Text("Bienvenido al login de Kyty",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          controller: tecUsername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu usuario',
          ),
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(
          controller: tecPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu contraseña',
          ),
          obscureText: true,
        ),
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

    Scaffold scaf=Scaffold(body: columna,
      //backgroundColor: Colors.deepOrange,
      appBar: appBar,);

    return scaf;

  }

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
          "Usuarios").doc(uid).get();
      if (datos.exists) {
        print("EL NOMBRE DEL USUARIO LOGEADO ES: " + datos.data()?["nombre"]);
        print("LA EDAD DEL USUARIO LOGEADO ES: " +
            datos.data()!["edad"].toString());
        print("LA ALTURA DEL USUARIO LOGEADO ES: " +
            datos.data()!["altura"].toString());
        Navigator.of(_context).popAndPushNamed("/homeview");
      }

      else {
        Navigator.of(_context).popAndPushNamed("/perfilview");
      }
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

  }

}