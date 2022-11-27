import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/navigation/Navigation.dart';
import 'package:untitled/screens/sign_up.dart';
import '../riesgos/ui/screens/bienvenida.dart';
import '../service/auth_service.dart';
import '../util/snackbar_util.dart';
import '../util/normal_button.dart';
import 'package:flutterfire_ui/auth.dart';


class Login extends StatefulWidget{
  const Login({Key? key}) : super(key:key);

  static Widget create(BuildContext context) => const Login();
  @override
  _login_screen createState() => _login_screen();

}


class _login_screen extends State <Login> {

  final _fromKey = GlobalKey<FormState>();
  final email_controler =  TextEditingController();
  final pswd_controler =  TextEditingController();

  final authService = AuthService();

  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  login_gmail_click (BuildContext context) async {
    try{
      final userCredential = await authService.signInWithGoogle();
      print('user credential GMAIL: ${userCredential}');
      if (userCredential != null) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Navigation()),
        );
      } else {
        SnackBarUtil.showSnackBar('Error en la autenticación', context);
      }
    }on Exception catch(ex){
      print('firebase exception: ${ex}');
      SnackBarUtil.showSnackBar('Error ${ex}', context);
    }

  }

  loginClick(BuildContext context) async {
    print('login function');
    if(_fromKey.currentState?.validate() == true){
      print('valid form OK');
      try {
        String email = email_controler.text.toLowerCase();
        String password = pswd_controler.text;
        final userCredential =
            await authService.loginWithEmailAndPassword(email, password);
        print('user credential: ${userCredential}');
        if (userCredential != null) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Navigation()));
        }else{
          SnackBarUtil.showSnackBar('Error en la autenticación', context);
        }

      } on FirebaseAuthException catch (e) {
        print('firebase exception: ${e.message}');
        SnackBarUtil.showSnackBar('Error ${e.message}', context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final txtEmail = TextFormField(
      controller: email_controler,
      decoration:
      const InputDecoration(
          hintText: "usuario@correo.com"),
      validator: emptyValidator,
    );
    final txtPswd = TextFormField(
      controller: pswd_controler,
      obscureText: true,
      decoration: const InputDecoration(hintText: "contraseña"),
      validator: emptyValidator,
    );

    return Scaffold(
        appBar: AppBar(title: Text("Login page"),),
      body: Form(
        key: _fromKey,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.black38,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(15.0, 15.0),
              ),
              ],
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/logo.png", height: 250),
              txtEmail,
              const SizedBox(height: 3),
              txtPswd,
              const SizedBox(height: 20),
              normal_button(
                  txt: 'Entrar',
                  onPressed: (){
                    loginClick(context);
                    },
                  imagePath: "assets/button/entrar.png"
              ),
              const SizedBox(height: 8),
              normal_button(
                  txt: 'Entrar con gmail',
                  onPressed: () {
                    login_gmail_click(context);
                  },
                  imagePath: "assets/button/gmail.png"),
              const SizedBox(height: 8),
              normal_button(
                txt: 'Entrar como invitado',
                onPressed: () => {},
                imagePath: "assets/button/invitado.png"),
              const SizedBox(height: 8),
              link_register(),
            ],
          ),
        ),
      ),
    );
  }
}



class link_register extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => new SignUp())
        );
        },
      child: const Text('¿No tienes cuenta? Crea una cuenta'),
    );
  }
}

