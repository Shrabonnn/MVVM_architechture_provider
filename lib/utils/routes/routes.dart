import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context)=> HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context)=> LoginScreen());
      default :
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text("No Route has been selected"),
          ),
        ));
    }
  }
}