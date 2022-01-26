import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'login/authentication.dart';
import 'login/wrapper.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xF1F1F1F1)),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorWidget();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(providers: [
            ChangeNotifierProvider<AuthService>.value(value: AuthService()),
            StreamProvider<String?>.value(
              value: AuthService().user,
              initialData: "",
            )
          ],
          child: Wrapper()
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("ha ocurrido un error")],
        ),
      ),
    );
  }

}

  class Loading extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

  }

class MyUser {
  MyUser();
}