import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/Review_view.dart';


class review_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review_view(
                "assets/estudiante.jpg", "Clara Molinos", "1 review", "Me gusta!", 4)
          //aquí crearía más review, supongo q depende BD
      ],
    );
  }
}
