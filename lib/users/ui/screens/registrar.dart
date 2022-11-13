import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/users/bloc/signup_cubit.dart';
import 'package:untitled/users/bloc/signup_state.dart';
import 'package:untitled/widgets/lista_desplegables.dart';

import '../../resources/auth_resources.dart';

class signup extends StatelessWidget {
  @override
  const signup({Key? key}) : super (key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const signup());
  }

  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
         padding: const EdgeInsets.all(20.0),
       child:BlocProvider<signup_cubit>(
         create: (_) => signup_cubit(context.read<auth_resources>()),
         child : const signup_form(),
       ),
     ),
   );
  }
}
/*
class txt_name extends StatelessWidget {
  Widget build(BuildContext context) {
    return  BlocBuilder<signup_cubit, signup_state>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<signup_cubit>().emailChanged(email);
            },
          decoration: InputDecoration(
              hintText: "Nombre"
          ),
        );
        },
    );
  }
}

 */
/*/
class txt_subname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<signup_cubit, signup_state>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<signup_cubit>().emailChanged(email);
          },
          decoration: InputDecoration(
              hintText: "Apellidos"
          ),
        );
      },
    );
  }


}

 */


class  txt_email extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<signup_cubit, signup_state>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<signup_cubit>().emailChanged(email);
          },
          controller: email,
          decoration: InputDecoration(
              hintText: "usuario@correo.com"
          ),
        );
      },
    );
  }
}


class  txt_pswd extends StatelessWidget {
  TextEditingController pswd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<signup_cubit, signup_state>(
      buildWhen: (previous, current) => previous.pswd != current.pswd,
      builder: (context, state) {
        return TextField(
          onChanged: (pswd) {
            context.read<signup_cubit>().pswdChanged(pswd);
          },
          controller: pswd,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "contraseña"
          ),
        );
      },
    );
  }
}

class button_signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<signup_cubit, signup_state>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == signup_status.submitting ?
            const CircularProgressIndicator()  :
            ElevatedButton(
              style:  ElevatedButton.styleFrom(
                  fixedSize: const Size(200,40)),
                onPressed: () {
                context.read<signup_cubit>().signupFormSubmitted();
                },
                child: const Text ("Regustrar"),
            );
      },
    );
  }
}
/*
class  txt2_pswd extends StatelessWidget {
  TextEditingController pswd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pswd,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "repite la contraseña"
      ),
    );
  }
}


 */

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


