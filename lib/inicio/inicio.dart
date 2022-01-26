import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metalurgica/login/login.dart';
import 'package:metalurgica/login/wrapper.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatefulWidget {
  final Function? toggleScreen;
  const Inicio({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();

}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        color: Color(0XFF180C5F),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.center,
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
                      Image.asset('assets/logo-uom-blanco1.png',
                          height: 217,
                          width: 219,
                          fit: BoxFit.fill
                      ),
                      SizedBox(height: 0),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: new Text(
                                  'UNIÓN OBRERA METALÚRGICA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFF74C14),
                                      fontFamily: "Roboto", fontSize: 34, fontWeight: FontWeight.w900),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: new Text(
                                  'Seccional Morón',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: "Roboto", fontSize: 30),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        padding: EdgeInsets.all(12),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                child: new Text(
                                  '¡Bienvenido!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: "Roboto", fontSize: 34, fontWeight: FontWeight.w500),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: () async {

                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('pristine', false);
                          widget.toggleScreen!('LoginScreen');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('pristine', false);
                          widget.toggleScreen!('RegisterScreen');
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
      ),
    );
  }
}