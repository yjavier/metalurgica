import 'package:flutter/cupertino.dart';
import 'package:metalurgica/login/register.dart';

import 'login.dart';

class Authentication extends StatefulWidget {
  final Function? getView;
  final Function? setView;
  const Authentication({Key? key, this.getView, this.setView}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  void toggleScreen(view) {
    setState(() {
      widget.setView!(view);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("=================================================");
    print("=================================================");
    print("=====================ssdfsdfsdfdsfds===========================");
    print(widget.getView!());
    print("========================sdfsdfsdfsfs=========================");
    print("=================================================");
    print("=================================================");
    if (widget.getView!() == 'RegisterScreen') {
      widget.setView!('');
      return RegisterScreen(toggleScreen: toggleScreen);
    } else if (widget.getView!() == 'LoginScreen') {
      return LoginScreen(toggleScreen: toggleScreen);
    } else {
      return LoginScreen(toggleScreen: toggleScreen);
    }
  }
}