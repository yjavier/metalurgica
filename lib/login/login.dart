import 'dart:math';
import 'package:flutter/material.dart';
import 'package:metalurgica/login/recovery.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Function? toggleScreen;
  const LoginScreen({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _formKey = new GlobalKey<FormState>();
  TextEditingController _emailControler  = TextEditingController();
  TextEditingController _passwordControler  = TextEditingController();

  @override
  void initState() {
    _emailControler = TextEditingController();
    _passwordControler = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
        body: Container(
          height: height,
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 60),
                        Image.asset('assets/logo_color1.png',
                          height: 90,
                          width: 500,
                          fit: BoxFit.fill,),
                        SizedBox(height: 111),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _emailControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          hintText: "INGRESÁ TU MAIL",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _passwordControler,
                                      validator: (val) => val!.isEmpty ? 'Password can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "INGRESÁ TU CONTRASEÑA",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true))
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 160),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              print("email: ${_emailControler.text}");
                              print("email: ${_passwordControler.text}");
                              await loginProvider.login(
                                  _emailControler.text.trim(),
                                  _passwordControler.text.trim(),
                                  context: context);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(2, 4),
                                    blurRadius: 5,
                                    spreadRadius: 2)
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFFF74C14),
                                  Color(0xFFF74C14),
                                ],
                              ),
                            ),
                            child: loginProvider.isLoading
                                ? CircularProgressIndicator()
                                : Text( 'Ingresar', style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => recoveryScreen()),
                            );
                            //widget.toggleScreen!();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Olvidé mi usuario/contraseña',
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: BorderSide(color: Color(0xFFF74C14), width: 3),
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () async {
                            widget.toggleScreen!('RegisterScreen');
                            //await loginProvider.signInWithGoogle(context: context);
                          },
                          child: loginProvider.isLoading
                              ? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator()
                              )
                              : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Registrarme',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFF74C14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}