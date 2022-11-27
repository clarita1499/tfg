
import 'package:flutter/material.dart';
import 'package:untitled/util/gradientBack.dart';

import '../modelos/User.dart';


class user_info extends StatelessWidget {

  //MyUser user;

  user_info();

  @override
  Widget build(BuildContext context) {
    final txt_name = Text(
      //user.name ?? '',
      "name",
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Lato',
      ),
    );
    final txt_lastname = Text(
      //user.lastname ?? '',
      "lastName",
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Lato',
      ),
    );
    final txt_email = Text(
      //user.email ?? '',
        "email",
        style: TextStyle(
            fontSize: 15.0,
            color: Colors.white30,
            fontFamily: 'Lato'
        )
    );

    // TODO: implement build
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(
        top: 100.0,
        bottom: 20.0,
        right: 10.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white,
            width: 2.0,
            style: BorderStyle.solid
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/estudiante.jpg"),
            //image: NetworkImage("image")
          //user.image ?? '')
          // )
        ),
      ),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              bottom: 5.0,
                  top: 80.0,
            left: 10.0,
          ),
          child: Column (
            children: <Widget>[
              txt_name,
              txt_lastname,
              txt_email
            ],
          ),
        ),
      ],
    );

  return Container(
    padding: EdgeInsets.all(20.0),
    child: Row(
      children: <Widget>[
        userPhoto,
        userInfo
      ],
    ),
  );
  }
}