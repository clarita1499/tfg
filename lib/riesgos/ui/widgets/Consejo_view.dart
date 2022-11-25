import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../widgets/text_input.dart';
import '../../model/Consejo.dart';
import 'button_inkWell.dart';

class Consejo_view extends StatelessWidget {

  final MyConsejo consejo;

  Consejo_view(this.consejo);

  @override
  Widget build(BuildContext context) {
    final titulo = Container(
      margin: new EdgeInsets.only(
          top: 8.0,
          left: 20.0,
          right: 20.0
      ),
      child: new Text(
        this.consejo.titulo,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
            color: Colors.indigo //negrita
        ),
      ),
      alignment: Alignment.bottomLeft,
    );
    final description = Container(
      margin: new EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0
      ),
      child: new Text(
        this.consejo.description,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575a),
        ),
      ),
    );
    final likes = Container(
      child: Text(
        'Likes ${this.consejo.likes}',
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
        textAlign: TextAlign.right,
      ),
      alignment: Alignment.bottomRight,
    );
    final user = Container(
      child: Text(
        'Creador ${this.consejo.userOwner?.name} '
            ' ${this.consejo.userOwner?.lastname}',
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
          color: Colors.indigo,
        ),
      ),
      alignment: Alignment.bottomRight,
    );

    final like_user = Column(
      children: [
        likes,
        user,
      ],
    );

    final details = Row(
        children: [
          link_coment(),
          like_user,
        ]
    );
    final view = Column(
      children: <Widget>[
        titulo,
        description,
        details
      ],
    );

    final box = Container(
      decoration: BoxDecoration(
        color: Color(0xFFF8DAA0).withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(top: 2),
      width: 400,
      height: 110,
      alignment: Alignment.bottomRight,
      child: Text(
        '',
        style: TextStyle(fontSize: 32, color: Color(0xFF04589A)),
      ),
    );

    return Stack(
      children: [
        box,
        view,
      ],
    );
  }
}

class link_coment extends StatelessWidget{
  final _controllerComment = TextEditingController();
  //final _controller = TextEditingController();
  @override
    // TODO: implement build
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(20.0),
              height: 300.0,
              color: Colors.white60,
              child: Column(
                children: [
                  Text(
                    "Añadir comentario",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextInput( //Description
                    hintText: "Comentario",
                    inputType: TextInputType.multiline,
                    maxLines: 5,
                    controller: _controllerComment,
                  ),
                  //aqui falta poder calificar con las estrellitas
                  button_inkWell(
                      button_txt: 'Añadir',
                      onPressed: () {}
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 12.0, right: 200, top: 5.0),
        child: const Text(
          "Comentar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Lato",
            decoration: TextDecoration.underline,
            fontSize: 14.0,
            color: Colors.black26,
          ),),
      ),
    );
  }
}

class botton_like extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LikeButton(
      size:  30.0,
      circleColor:
      CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.home,
          color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
          size: 30.0,
        );
      },
      likeCount: 665,
      countBuilder: (int? count, bool isLiked, String text) {
        var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
        Widget result;
        if (count == 0) {
          result = Text(
            "love",
            style: TextStyle(color: color),
          );
        } else
          result = Text(
            text,
            style: TextStyle(color: color),
          );
        return result;
      },
    );
  }

}
