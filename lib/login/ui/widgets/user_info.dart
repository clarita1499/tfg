
import 'package:flutter/material.dart';


class user_info extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
 /* user usuario;

  user_info({required this.usuario});

  @override
  Widget build(BuildContext context) {
    final txt_name = Text(
      usuario.name ?? '',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Lato',
      ),
    );
    final txt_subname = Text(
      usuario.subname,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Lato',
      ),
    );
    final txt_email = Text(
        usuario.email ?? '',
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
        right: 20.0
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
          //image: AssetImage(user.photo ?? ''),
          image: NetworkImage(usuario.photo ?? '')
       // )
      ),
    ),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                bottom: 5.0
            ),
            child: Row(
                children: <Widget>[
                  txt_name,
                  txt_subname,
                  txt_email
                ],
            ),
        ),
      ],
    );
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 0.0
      ),
      child: Row(
        children: <Widget>[
          userPhoto,
          userInfo
        ],
      ),
    );
  }
  
  */
   
}