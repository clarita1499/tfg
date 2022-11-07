import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:untitled/riesgos/ui/widgets/menu_principal.dart';
import 'package:untitled/users/bloc/bloc_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/users/ui/screens/login.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          title: 'Fluter demo',
          home: login()
          //menu_principal(),
        ),
        bloc: bloc_user()
    );

      /*MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: menu_principal()
    );
       */
  }
}


