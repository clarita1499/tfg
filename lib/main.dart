

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/screens/login.dart';
import 'package:untitled/ui/widgets/ui_riesgos//screens/bienvenida.dart';
import 'package:untitled/navigation/Navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/service/auth_service.dart';

import 'service/firebase_options.dart';



final getIt = GetIt.instance;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectDependencies();

  runApp(App());
}

final _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Authentication Flow',
      home: Navigation(),
    );
  }
}

  Future<void> injectDependencies() async {
    // Inject the data sources.
    getIt.registerLazySingleton(() => AuthService());

    // Inject the Repositories. Note that the type is the abstract class
    // and the injected instance is the implementation.
   // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
   // getIt.registerLazySingleton<MyUserRepository>(() => MyUserRepositoryImp());
}









