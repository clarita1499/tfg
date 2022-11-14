
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/AuthCubit.dart';

class perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PERFIL"),
          actions: [
            IconButton(
              onPressed: () => context.read<AuthCubit>().signOut(),
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) => current is AuthtSignedIn,
          builder: (_, state) {
            final authUser = (state as AuthtSignedIn).user;
            return Align(
              alignment: const Alignment(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nombre: ${authUser.uid}'),
                  CircleAvatar(
                    radius: 50, backgroundImage: authUser.photo != null ?
                  NetworkImage(authUser.photo!) : null,
                    child: authUser.photo == null ? Icon(Icons.person) : null,)
                ],
              ),
            );
          },
        )
    );

    /* Stack(
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

      */

  }
}