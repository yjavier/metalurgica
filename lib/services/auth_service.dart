import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService with ChangeNotifier {
  late String _uid;
  late String _email;
  bool _isLoading = false;
  String _errorMessage = "";
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  String get getUid => _uid;
  String get getEmail => _email;

  Future register(String email, String password, Map<String, String?> userInfo, {required BuildContext context}) async {
    if (_isLoading) return;
    setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      _uid = user!.uid;
      _email = user.email!;
      DatabaseReference _messagesRef = database.ref();
      _messagesRef.child("users").child(_uid).set(userInfo);
      setLoading(false);
      return user;
    } on SocketException{
      setLoading(false);
      setMessage("No internet");
      alert(context: context, msg: "No internet");
    } on FirebaseAuthException catch (e) {
      print(e);
      setLoading(false);
      setMessage(e.message);
      alert(context: context, msg: e.message.toString());
    }
    notifyListeners();
  }

  Future login(String email, String password, {required BuildContext context}) async {
    if (_isLoading) return;
    setLoading(true);
    try {
      UserCredential authResult = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      _uid = user!.uid;
      _email = user.email!;
      setLoading(false);
      return user;
    } on SocketException{
      setLoading(false);
      setMessage("No internet");
      alert(context: context, msg: "No internet");
    } on FirebaseAuthException catch (e) {
      print(e);
      setLoading(false);
      setMessage(e.message);
      alert(context: context, msg: e.message.toString());
    }
    notifyListeners();
  }

  Future signInWithGoogle({required BuildContext context}) async {
    if (_isLoading) return;
    setLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.signIn();
    } on SocketException{
      setLoading(false);
      setMessage("No internet");
      alert(context: context, msg: "No internet");
    } catch (e) {
      print(e);
      setLoading(false);
      alert(context: context, msg: "Se produjo un error al utilizar el inicio de sesión de Google. Intentar otra vez.");
    }


    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        setLoading(false);
        if (e.code == 'account-exists-with-different-credential') {
          alert(context: context, msg: "La cuenta ya existe con una credencial diferente.");
        }
        else if (e.code == 'invalid-credential') {
          setLoading(false);
          alert(context: context, msg: "Se produjo un error al acceder a las credenciales. Intentar otra vez.");
        }
      } catch (e) {
        setLoading(false);
        alert(context: context, msg: "Se produjo un error al utilizar el inicio de sesión de Google. Intentar otra vez.");
      }
    }
    setLoading(false);
    return user;
  }

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  void alert({required BuildContext context, required String msg}) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(msg),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ));
  }

  Stream <String> get user =>
      firebaseAuth.authStateChanges().map((event)  {
        if (event != null) {
          return event.uid;
        }
        return "";
      });
}

