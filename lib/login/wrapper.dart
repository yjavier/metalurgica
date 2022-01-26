
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:metalurgica/home/home.dart';
import 'package:metalurgica/inicio/inicio.dart';
import 'package:metalurgica/login/authentication.dart';
import 'package:metalurgica/login/login.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();

}

class _WrapperState extends State<Wrapper> {
  String  isToggle = '';
  void toggleScreen(view) {
    setState(() {
      setView(view);
    });
  }

  String view = '';
  String getView() {
    return view;
  }

  void setView(vie) {
    view = vie;
  }

  @override
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: hasAlreadyStarted(),
      builder: (context, snapshot) {
        final user = Provider.of<String>(context);
        if (snapshot.data == null) {
          return Loading();
        } else {

          if (snapshot.data == true && isToggle == '') {
            return Inicio(toggleScreen: toggleScreen);
          } else {
            if (user != "") {
              return HomeScreen();
            } else {
              return Authentication(getView: getView, setView: setView);
            }
          }
        }
      },
    );
  }

  Future<bool> hasAlreadyStarted() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool("pristine") == null ||
          prefs.getBool("pristine") == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("error");
      return false;
    }
  }
}
