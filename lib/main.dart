
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/login/bloc/AuthCubit.dart';
import 'package:untitled/login/repository/AuthRepository.dart';
import 'package:untitled/login/ui/screens/login.dart';
import 'package:untitled/widgets/menu_principal.dart';

import 'Routes.dart';
import 'firebase_options.dart';


final _navigatoryKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final auth_cubit = AuthCubit(AuthRepository());

  runApp(
    BlocProvider(
      create: (_) => auth_cubit..init(),
      child: App.create(),
    ),
  );
  /*
  final authresources = auth_resources();
  await authresources.get_user.first;
   */
}
class App extends StatelessWidget {

  const App({Key? key }) : super (key: key);

  static Widget create() {
    return BlocListener <AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthtSignedOut) {
          _navigatoryKey.currentState?.pushNamedAndRemoveUntil(
              Routes.login, (r) => false);
        } else if (state is AuthtSignedIn) {
          _navigatoryKey.currentState?.pushNamedAndRemoveUntil(
              Routes.home, (r) => false);
        }
      },
      child: const App()
      );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          navigatorKey: _navigatoryKey,
          title: "TFG CLARA_",
          //onGenerateRoute: Routes.routes,
          home: menu_principal(),
        );
  }

}






