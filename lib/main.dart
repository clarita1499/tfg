

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/User/repository/Firebase_data_source.dart';
import 'package:untitled/User/repository/Implementation/myUser_repository.dart';
import 'package:untitled/User/repository/myUser_repository.dart';
import 'package:untitled/User/ui/screens/login.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/widgets/Navigation.dart';
import 'package:get_it/get_it.dart';

import 'User/bloc/auth_cubit.dart';
import 'User/repository/Implementation/auth_repository.dart';
import 'User/repository/auth_repository.dart';
import 'firebase_options.dart';



final getIt = GetIt.instance;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await injectDependencies();

  runApp(
      BlocProvider(
          create: (_) => AuthCubit()..init(),
        child: App())
  );
}

final _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState?.pop(
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new login_screen())
              ));
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState?.pop(
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new bienvenida())
              ));
        }
      },
      child: const App(),
    );
  }

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
    getIt.registerLazySingleton(() => FirebaseDataSource());

    // Inject the Repositories. Note that the type is the abstract class
    // and the injected instance is the implementation.
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
    getIt.registerLazySingleton<MyUserRepository>(() => MyUserRepositoryImp());
}









