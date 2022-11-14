import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login/bloc/AuthCubit.dart';

import '../../../Routes.dart';
import '../../../widgets/normal_button.dart';
import '../widgets/button_green.dart';



class login_screen extends StatefulWidget{
  const login_screen({Key? key}) : super(key:key);

  static Widget create(BuildContext context) => const login_screen();
  @override
  _login_screen createState() => _login_screen();

}


class _login_screen extends State <login_screen> {

  final _fromKey = GlobalKey<FormState>();
  final email_controler =  TextEditingController();
  final pswd_controler =  TextEditingController();

  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  @override
  Widget build(BuildContext context) {
    final link_signup = TextButton(
        onPressed: () =>
            Navigator.pushNamed(
                context, Routes.signup),
        child: const Text("¿No tienes cuenta? Crea una cuenta")
    );
    final txt_email = TextField(
      controller: email_controler,
      decoration:
      const InputDecoration(
          hintText: "usuario@correo.com"
      ),
    );
    final txt_pswd = TextField(
      controller: pswd_controler,
      obscureText: true,
      decoration: const InputDecoration(hintText: "contraseña"),
    );

    /*
    final isSigningIn = context.watch<AuthCubit>().state is AuthtSignedIn;
    return AbsorbPointer(
      absorbing: isSigningIn,//no hace nada cuando estamos iniciando sesión
      child :


     */
    return Scaffold(
        appBar: AppBar(title: Text("Home page"),),
        body: BlocBuilder<AuthCubit,AuthState>(
        //buildWhen: (previous,current) => current is AuthtSignedIn,
          builder: (_, state) {
            return Form(
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
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is AuthtSigningIn)
                    const Center(child: CircularProgressIndicator()),
                  if (state is AuthError)
                    Text(
                      state.message,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 24),
                    ),
                  Image.asset("assets/logo.png", height: 250),
                  txt_email,
                  const SizedBox(height: 3),
                  txt_pswd,
                  const SizedBox(height: 20),
                  normal_button(
                      txt: "Entrar",
                      onPressed: () {
                        if(_fromKey.currentState?.validate() == true){
                          context.read<AuthCubit>().signInWithEmailAndPswd(
                              email_controler.text,
                              pswd_controler.text
                          );
                        }
                      },
                      imagePath: "assets/button/entrar.png"),
                  const SizedBox(height: 8),
                  normal_button(
                      txt: "Entrar con gmail",
                      onPressed: () =>
                          context.read<AuthCubit>().signInWithGoogle(),
                      imagePath: "assets/button/gmail.png"),
                  const SizedBox(height: 8),
                  normal_button(
                      txt: "Entrar como invitado",
                      onPressed: () =>
                          context.read<AuthCubit>().signInAnonymusly(),
                      imagePath: "assets/button/invitado.png"),
                  const SizedBox(height: 8),
                  link_signup,
                ],
              ),
              //me falta poner por algun lado el circularprogess indicator
              // if(isSigningIn) CircularProgressIndicator()
            ),
            );
          }
    ),
    );
    }
  }



