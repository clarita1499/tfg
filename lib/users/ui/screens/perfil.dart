import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled/users/bloc/user_bloc.dart';
import 'package:untitled/users/bloc/user_event.dart';
import 'package:untitled/users/model/user.dart';
import 'package:untitled/users/ui/widgets/back_ground_profile.dart';
import 'package:untitled/users/ui/widgets/button_bar.dart';

import '../../../riesgos/ui/widgets/gradientBack.dart';

class perfil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = context.select((user_bloc bloc) => bloc.state.usuario);
    return Scaffold(
      appBar: AppBar(
        title: Text("PERFIL"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<user_bloc>().add(logout_requested()
                );
              },
              icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Align(
        alignment: const Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: user.photo != null ?
            NetworkImage(user.photo!) : null,
            child: user.photo == null ? Icon(Icons.person) : null ,)
          ],
        ),
      ),
    );
      Stack(
      children: <Widget>[
        gradientBack("PERFIL"),
        back_ground_profile(),
        ListView(
          children: <Widget>[
           //perfil_header()
          ],
        ),
      ],
    );
  }
  
}