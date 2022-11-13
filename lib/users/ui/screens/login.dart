import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/users/bloc/login_cubit.dart';
import 'package:untitled/users/bloc/login_state.dart';
import 'package:untitled/users/resources/auth_resources.dart';
import 'package:untitled/users/ui/screens/registrar.dart';



class login_screen extends StatelessWidget{
  const login_screen({Key? key}) : super(key: key);

  static Page pages() => const MaterialPage(child: login_screen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        boxShadow: [BoxShadow(
        color: Colors.black38,
        blurRadius: 25.0,
        spreadRadius: 5.0,
        offset: Offset(
        15.0, 15.0
    )
    )
    ],
    color: Colors.indigo,
    borderRadius: BorderRadius.circular(20)
    ),
    margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
    padding: EdgeInsets.only(left: 20, right: 20),
    child: BlocProvider(
      create: (_) => login_cubit(context.read<auth_resources>()),
      child: const login_form(),
    ),
        ),
    );
  }
}


class login_form extends StatelessWidget {

  const login_form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener <login_cubit, login_state>(
        listener: (context,state){
          if(state.status == login_status.error){
            //do something if there is an error
          }
        },
      child : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/logo.png", height: 250),
          _txt_email(),
          const SizedBox(height: 8),
          _txt_pswd(),
          const SizedBox(height: 8),
          _button_entrar(),
          const SizedBox(height: 8),
      ]
      ),
    );
  }
}

class _txt_email extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<login_cubit, login_state>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<login_cubit>().email_changed(email);
          },
          controller: email,
          decoration: const InputDecoration(hintText: "usuario@correo.com"),
        );
      },
    );
  }
}

class _txt_pswd extends StatelessWidget {
  TextEditingController pswd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<login_cubit, login_state>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
            onChanged: (pswd) {
              context.read<login_cubit>().email_changed(pswd);
              },
          controller: pswd,
          obscureText: true,
          decoration: const InputDecoration(hintText: "contraseña"),
        );
        },
    );
  }
}

class _button_entrar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<login_cubit, login_state>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == login_status.submitting
            ? const CircularProgressIndicator() : ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 40),
    ),
    onPressed: () {
    context.read<login_cubit>().logiWithCredentials();
    },
    child: const Text("Entrar"),
    );
        },
    );
  }
}

    /*Container(
    margin: EdgeInsets.only(top: 70),
    width: 200,
    decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(10)
    ),
    child: IconButton(
    icon: Text("Entrar",
    style: TextStyle(color: Colors.white, fontSize: 20),),
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (_) => menu_principal()));
    }
    ),
    );
    ),
    },
  }
}

     */
class link_signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextButton(
        onPressed:() => Navigator.of(context).push<void>(
          signup.route(),
        ),
    child: const Text("¿No tienes cuenta? Crea una cuenta"),
    );
  }
}

/*



    );

    // TODO: implement build

        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(

              button_green( txt:"Entrar con Gmail",
                  width: 300,
                  onPressed: (){
    /*
            // userBloc.signOut();
            //   userBloc.signIn().then((
            UserCredential user) =>
            print("El usuario es ${user.user?.displayName}"));

     */
                  },
                  height: 50.0),
              SizedBox(height: 50),
              link_register

 */
