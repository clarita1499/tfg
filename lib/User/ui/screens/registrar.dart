


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/auth_cubit.dart';
import 'login.dart';

class signup_screen extends StatefulWidget{
  static Widget create(BuildContext context) => signup_screen();

  @override
  State<StatefulWidget> createState() => _signup_screen();
  }

class _signup_screen extends State <signup_screen> {
  final _formKey = GlobalKey<FormState>();
  final email_controler = new TextEditingController();
  final pswd_controler = new TextEditingController();
  final pswd2_controler = new TextEditingController();


  String ? emailValidator(String? value){
  return (value == null || value.isEmpty) ? 'Este campo es obligatorio' : null;
}
  String ? pswdValidator(String? value){
    if (value == null || value.isEmpty) return 'Este campo es obligatorio';
    if(value.length <6) return "La contraseña debe más de 6 carácteres";
    if (pswd_controler.text != pswd2_controler.text) return "Las contraseñas deben coincidir";
    return null;
  }

  Widget build(BuildContext context) {
    final txt_email = TextFormField(
      controller: email_controler,
      decoration: InputDecoration(
          hintText: "usuario@correo.com"
      ),
      validator: emailValidator,
    );
    final txt_pswd = TextFormField(
      controller: pswd_controler,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "contraseña"
      ),
      validator: pswdValidator,
    );
    final txt2_pswd = TextFormField(
      controller: pswd2_controler,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Repite contraseña"
      ),
      validator: pswdValidator,
    );
    final button_lognUp = ElevatedButton(
        child: const Text ("Registrar"),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(100,40)),
        onPressed: () {
          if (_formKey.currentState?.validate()==true){
            context.read<AuthCubit>().createUserWithEmailAndPassword(
                email_controler.text,
                pswd_controler.text
            );
          }
        }
    );
        final button_atras = ElevatedButton(
            child: const Text ("Atrás"),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(100,40)),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new login_screen())
              );
            },
            );

   return Scaffold(
     body: BlocBuilder<AuthCubit,AuthState>(
       builder: (_,state){
         return Form(
           key: _formKey,
           child: Padding(
             padding:  const EdgeInsets.all(16.0),
           child: Column(
             children: [
               if (state is AuthSigningIn) Center(child: CircularProgressIndicator()),
               if (state is AuthError)
                 Text(state.message,
                   style: TextStyle(
                     color : Colors.red,
                     fontSize: 24,
                   ),
                 ),
                 txt_email,
                 SizedBox(height: 8),
               txt_pswd,
               SizedBox(height: 8),
               txt2_pswd,
               SizedBox(height: 8),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   button_lognUp,
                   SizedBox(height: 8),
                   button_atras,
                 ],
               ),
             ],
         ),
         ),
     );
  }
   ),
    );

  }
}






/*
class signup_form extends StatelessWidget {

  const signup_form({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return BlocListener <signup_cubit, signup_state>(
        listener: (context,state){
      if(state.status == signup_status.error){
        //do something if there is an error
      }
    },
    child : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //txt_name(),
        //txt_subname(),
        lista_desplegable(),
        txt_email(),
        txt_pswd(),
        //txt2_pswd()
      ],
    ),
    );
  }
}

 */



    /*return Scaffold(
      //ME FALTA ALGÚN TITULO DE REGISTRO
      body: Center(
        child: Stack(
            children: <Widget>[
              gradientBack("REGISTRO"),
              campos
            ],
        )
      ),
    );
  }
 }

     */


