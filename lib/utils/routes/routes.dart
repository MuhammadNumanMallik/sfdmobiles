

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfdmobile/view/home_screens/form/new_phone_form.dart';

import '../../view/home_screen.dart';
import '../../view/home_screens/new_phones.dart';
import '../../view/login_view.dart';
import '../../view/splash_view.dart';



class RoutesName {

  static const String splash = 'splash_view' ;


  //accounts routes name
  static const String login = 'login_screen' ;
  static const String signUp = 'signup_screen' ;

  //home screen routes name
  static const String home = 'home_sceen' ;
  static const String new_phone = 'new_phone' ;
  static const String new_phone_entry_form = 'new_phone_entry_form' ;



}

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.new_phone:
        return MaterialPageRoute(builder: (BuildContext context) => const New_Phones());
      case RoutesName.new_phone_entry_form:
        return MaterialPageRoute(builder: (BuildContext context) => const New_Phone_Entry());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}