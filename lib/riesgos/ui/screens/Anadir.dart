import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/util/button_inkWell.dart';
import 'package:untitled/util/gradientBack.dart';

import '../../../util/Title_header.dart';
import '../../../util/text_input.dart';

class anadir_consejo extends StatefulWidget {

  File? image;

  anadir_consejo({this.image});


  @override
  State createState() {
    return _anadir_consejo();
  }
}

class _anadir_consejo extends State<anadir_consejo> {
  @override
  Widget build(BuildContext context) {

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          gradientBack("Añadir consejo"),
          Container(
            margin: EdgeInsets.only(top: 130.0, bottom:20.0, left: 20.0, right: 20.0),
            child: Text(
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
          /*
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 275.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ),
              ),
            ],
          ),

           */
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
                            controller: _controllerTitlePlace,
                          ),
                        ),
                        TextInput(//Description
                          hintText: "Description",
                          inputType: TextInputType.multiline,
                          maxLines: 4,
                          controller: _controllerDescriptionPlace,
                        ),
                        Container(
                          width: 70.0,
                          child: button_inkWell(
                            button_txt: "Añadir consejo",
                            onPressed: (
                            //subir el consejo al Firebase Storage
                                //devuelve una url de la imagen
                                //Cloud Firestore ->
                                //guardo el consejo - titulo, descripcion, owner, like
                            ) {}
                          ),

                        )
                      ],
                    ),
                  ),
        ],
      ),
    );
  }
}

