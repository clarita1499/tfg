import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/User/ui/screens/registrar.dart';
import '../../../riesgos/ui/screens/bienvenida.dart';
import '../../../widgets/normal_button.dart';
import '../../bloc/auth_cubit.dart';
import 'package:flutterfire_ui/auth.dart';


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
    final txt_email = TextFormField(
      controller: email_controler,
      decoration:
      const InputDecoration(
          hintText: "usuario@correo.com"),
      validator: emptyValidator,
    );
    final txt_pswd = TextFormField(
      controller: pswd_controler,
      obscureText: true,
      decoration: const InputDecoration(hintText: "contraseña"),
      validator: emptyValidator,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Login page"),),
        //body: BlocBuilder<AuthCubit,AuthState>(
          //buildWhen: (previous,current) => current is AuthtSignedIn,
            //builder: (_, state) {
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
                      /*
                      if (state is AuthSigningIn)
                        const Center(child: CircularProgressIndicator()),
                      if (state is AuthError)
                        Text(
                          state.message,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15),
                        ),

                     */
                      Image.asset("assets/logo.png", height: 250),
                      txt_email,
                      const SizedBox(height: 3),
                      txt_pswd,
                      const SizedBox(height: 20),
                      normal_button(
                          txt: "Entrar ",
                          onPressed: (){
                            if(_fromKey.currentState?.validate() == true){
                              context.read<AuthCubit>().signInWithEmailAndPassword(
                                  email_controler.text,
                                  pswd_controler.text);
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => bienvenida())
                              );
                              //Navigator.pushNamed(context, Routes.home);
                            }
                            },
                          imagePath: "assets/button/entrar.png"
                      ),
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
                            context.read<AuthCubit>().signInAnonymously(),
                          imagePath: "assets/button/invitado.png"),
                      const SizedBox(height: 8),
                     link_register()
                    ],
                  ),
                  //me falta poner por algun lado el circularprogess indicator
                  // if(isSigningIn) CircularProgressIndicator()
                ),
                     ),
      ),
              );
            }
       // ),
     // ),
   // );
    }
  //}


  class link_register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => new signup_screen())
        );
        },
      child: const Text("¿No tienes cuenta? Crea una cuenta"),
    );
  }

  }

  /*
  class button_normal extends StatelessWidget{

    final String txt;
    double width = 0.0;
    double height = 0.0;
    final VoidCallback onPressed;
    Color color;
    String imagePath;

    normal_button({
      Key? key,
      required this.txt,
      this.height = 0.0,
      required this.onPressed,
      this.width = 0.0,
      this.color = Colors.white, //por defecto
      required this.imagePath
    }) {
      // TODO: implement normal_button
      throw UnimplementedError();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build}
    return Material(
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(6),
          child: Row(
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              SizedBox(width: 20),
              Text(
                txt,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
  }



   */

