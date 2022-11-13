import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/users/bloc/user_bloc.dart';
import 'package:untitled/users/bloc/user_state.dart';
import 'package:untitled/users/resources/auth_resources.dart';
import 'package:untitled/widgets/menu_principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Routes.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authresources = auth_resources();
  await authresources.get_user.first;
  runApp(App(authresources: authresources));
}

class App extends StatelessWidget {
  final auth_resources Auth_resources;

  const App({
    super.key,
    required auth_resources authresources,
  }) :Auth_resources = authresources;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return RepositoryProvider.value(
    //value: _auth_resources,
    return RepositoryProvider.value(
      value: Auth_resources,
      child: BlocProvider(
        create: (_) =>
            user_bloc(authresources: Auth_resources),
        child: const AppView(),
      ),
    );
  }
}

          /*child: MaterialApp(
           home: FlowBuilder(
             state: context.select((user_bloc bloc) => bloc.state.status),
             onGeneratePages: onGenerateAppViewPages,
           ),
        ),
          bloc: user_bloc(authresoruces: _auth_resources);
   // return RepositoryProvider.value(
     // value: _auth_resources,
    //  child :const myAppView(),
      /*BlocProvider(create: (_) => user_bloc(authresoruces: _auth_resources),
        child: const myAppView(),
      ),

       */
    );
  }
}


           */


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FlowBuilder <user_status>(
          state: context.select((user_bloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}







