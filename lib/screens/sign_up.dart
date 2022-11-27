


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modelos/User.dart';
import 'package:untitled/service/auth_service.dart';
import 'package:untitled/service/user_service.dart';
import 'package:untitled/util/button_inkWell.dart';
import 'login.dart';

class SignUp extends StatefulWidget{
  static Widget create(BuildContext context) => SignUp();

  @override
  State<StatefulWidget> createState() => _signup_screen();
  }

class _signup_screen extends State <SignUp> {
  final _formKey = GlobalKey<FormState>();
  final name_controler = new TextEditingController();
  final lastName_controler = new TextEditingController();
  final email_controler = new TextEditingController();
  final pswd_controler = new TextEditingController();
  final pswd2_controler = new TextEditingController();

  DateTime date = DateTime(2022,12,24);


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

    final txtName = TextFormField(
      controller: name_controler,
      decoration: const InputDecoration(
          hintText: 'Nombre'
      ),
      validator: emailValidator,
    );
    final txtLastName = TextFormField(
      controller: lastName_controler,
      decoration: const InputDecoration(
          hintText: 'Apeliido'
      ),
      validator: emailValidator,
    );

    final txtEmail = TextFormField(
      controller: email_controler,
      decoration: const InputDecoration(
          hintText: 'usuario@correo.com'
      ),
      validator: emailValidator,
    );

    final txtPswd = TextFormField(
      controller: pswd_controler,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'contraseña'
      ),
      validator: pswdValidator,
    );

    final txt2Pswd = TextFormField(
      controller: pswd2_controler,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Repite contraseña'
      ),
      validator: pswdValidator,
    );


    final buttonLognUp = button_inkWell(
        button_txt: "Registrar",
        onPressed: () {
          if (_formKey.currentState?.validate()==true){
            print("Vamos a añadirlo, ${MyUser}");
            /*
            AuthService.create...()
            if (isCreated) {
             return un dialogo con q ha sido creado correctamente
             */
            /*await UserService().add(MyUser(
              name_controler.text,
              lastName_controler.text,
              email_controler.text,
            )
            );

             */
          }
        });

        return Scaffold(
          appBar: AppBar(title: Text("Registro"),),
        body : Form(
           child: Padding(
             padding:  const EdgeInsets.all(16.0),
             child: Column(
             children: [
               txtName,
               txtLastName,
               txtEmail,
               SizedBox(height: 8),
               txtPswd,
               SizedBox(height: 8),
               txt2Pswd,
               SizedBox(height: 8),
               //DatePicker(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   buttonLognUp,
                 ],
               ),
             ],
             ),
           ),
        ),
     );
  }
}


class DatePicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker>{
  @override
  DateTime date = DateTime(2022,12,24);


  Widget build(BuildContext context) {
    final selected_date = Text(
    '${date.year}/${date.month}/${date.day}',
    style: TextStyle(fontSize: 20),
    );

    final boton = ElevatedButton(
        onPressed: () async{
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2002),
              lastDate: DateTime(2025),
          );
          if(newDate == null) return;
          setState(() => newDate);
        },
        child: Text('Selecciona fecha'),
    );

    return Scaffold(
      body: Row(
        children: [
          selected_date,
          boton
        ],
      ),
    );
  }

}








