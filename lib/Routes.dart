import 'package:flutter/material.dart';
import 'package:untitled/login/ui/screens/login.dart';
import 'package:untitled/login/ui/screens/registrar.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/widgets/SplashScreen.dart';

class Routes{
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/bienvenida';

  static Route routes (RouteSettings routeSettings){
    switch(routeSettings.name){
      case splash:
        return _buildRoute(SplashScreen.create);
      case login:
        return _buildRoute(login_screen.create);
      case signup:
        return _buildRoute(signup_screen.create);
      case home:
        return _buildRoute(bienvenida.create);
      default:
        throw Exception("Ruta no encontrada");
    }
  }
  static MaterialPageRoute _buildRoute (Function build) =>
      MaterialPageRoute(builder: (context) => build(context));

}

