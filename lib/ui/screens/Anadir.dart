import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/ui/util/button_inkWell.dart';
import 'package:untitled/ui/util/gradientBack.dart';
import '../util/text_input.dart';

class anadir_consejo extends StatefulWidget {

  anadir_consejo();

  @override
  State createState() {
    return _anadir_consejo();
  }
}

class _anadir_consejo extends State<anadir_consejo> {


  final _controllerTitle = TextEditingController();
  final _controllerDescription = TextEditingController();

  addConsejo(BuildContext context) async {
    print('Añadiendo consejo..');
    /*
    try {
      String title = _controllerTitle.text;
      String descript = _controllerDescription.text;

      final userCredential = await authService.registerUserWithEmailAndPassword(
          name,
          email,
          password
      );


      if (userCredential != null) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Navigation()));
      }else{
        SnackBarUtil.showWarningSnackBar('Error en la creación', context);
      }

    } on FirebaseException catch (e) {
      print('firebase exception: ${e.message}');
      SnackBarUtil.showWarningSnackBar('Error ${e.message}', context);
    }

       */
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          gradientBack("Añadir consejo"),
          Container(
            margin: EdgeInsets.only(top: 130.0, bottom:20.0, left: 20.0, right: 20.0),
            child: const Text(
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Font",
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              "Añade un consejo sobre los riesgos laborales en la Universidad,"
                  " ayudando así a mejorar el día a día de los demás usuarios"
          ),
          ),
                  Container(
                  margin: EdgeInsets.only(top: 300.0, bottom:20.0),
                    child: ListView(
                      children: <Widget>[
                        Container(//TextField Title
                        margin: EdgeInsets.only(bottom: 20.0),
                          child: TextInput(
                            hintText: "Title",
                            inputType: TextInputType.text,
                            maxLines: 1,
                            controller: _controllerTitle,
                          ),
                        ),
                        TextInput(//Description
                          hintText: "Description",
                          inputType: TextInputType.multiline,
                          maxLines: 4,
                          controller: _controllerDescription,
                        ),
                        Container(
                          width: 70.0,
                          child: button_inkWell(
                            button_txt: "Añadir consejo",
                            onPressed: () {
                              addConsejo(context);
                            }
                            ),
                        ),
                      ],
                    ),
                  ),
        ],
      ),
    );
  }
}

