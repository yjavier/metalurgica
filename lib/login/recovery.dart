import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';

class recoveryScreen extends StatefulWidget {
  @override
  _RecoveryScreenState createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<recoveryScreen> {

  static final _formKey = new GlobalKey<FormState>();
  TextEditingController _emailControler  = TextEditingController();

  String? _localidadControler = null;



  bool _obscureText = true;

  @override
  void initState() {
    _emailControler = TextEditingController();

    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoaderVisible = false;
    final height = MediaQuery.of(context).size.height;
    DateTime selectedDate;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Olvidé usuario/contraseña",
              style: TextStyle(color: Color(0Xff180C5F))
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              padding : const EdgeInsets.fromLTRB(30, 5, 5, 5),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Color(0Xff180C5F))
          ),
        ),
        body: LoaderOverlay(
          child: Container(
            height: height,
            child: Form(
              key: _formKey,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(32, 0, 26, 40),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 0),
                          Image.asset('assets/logo_color1.png',
                            height: 90,
                            width: 500,
                            fit: BoxFit.fill,),
                          SizedBox(height: 42),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Ingresa tu mail',
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "MAIL",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              print(_emailControler.text);
                              context.loaderOverlay.show(widget: LoadOverlay());
                              setState(() {
                                _isLoaderVisible = context.loaderOverlay.visible;
                              });
                              FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                              await firebaseAuth.sendPasswordResetEmail(email: _emailControler.text);
                              if (_isLoaderVisible &&
                                  context.loaderOverlay.overlayWidgetType ==
                                      LoadOverlay) {
                                context.loaderOverlay.hide();
                              }
                              setState(() {
                                _isLoaderVisible = context.loaderOverlay.visible;
                              });
                              _materialAlertDialog(context);
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
                              child: Text( 'Enviar', style: TextStyle(fontSize: 20, color: Colors.white),
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
          )
        ));
  }

  Future<void> _materialAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _buildCupertinoAlertDialog(),
    );
  }

  Widget _buildCupertinoAlertDialog() {
    return AlertDialog(
      title: Text('Recuperación'),
      content:
      Text("Te enviamos un correo, Ingresa a tu casilla y seguí las instrucciones para continuar con la recuperación de la contraseña"),
      actions: <Widget>[
        FlatButton(
            child: Text("Aceptar"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}

class LoadOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 12),
      ],
    ),
  );
}