import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_bloc/screens/change_password/presentation/page/change_password.dart';
import 'package:flutter_clean_architecture_bloc/screens/home/presentation/page/home.dart';
import 'package:flutter_clean_architecture_bloc/screens/login/presentation/page/login.dart';
import 'constants.dart';

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case CHANGE_PASSWORD_ROUTE:
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
