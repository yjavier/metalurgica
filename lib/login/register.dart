import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleScreen;
  const RegisterScreen({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {

  static final _formKey = new GlobalKey<FormState>();
  TextEditingController _nombreControler  = TextEditingController();
  TextEditingController _apellidoControler  = TextEditingController();
  TextEditingController _empresaControler  = TextEditingController();
  TextEditingController _numAfiliadoControler  = TextEditingController();
  TextEditingController _dniControler  = TextEditingController();
  TextEditingController _dateinput = TextEditingController();
  TextEditingController _celularControler  = TextEditingController();
  TextEditingController _emailControler  = TextEditingController();
  TextEditingController _passwordControler1  = TextEditingController();
  TextEditingController _passwordControler2  = TextEditingController();

  String? _localidadControler = null;



  bool _obscureText = true;

  @override
  void initState() {
    _nombreControler = TextEditingController();
    _apellidoControler = TextEditingController();
    _empresaControler = TextEditingController();
    _numAfiliadoControler = TextEditingController();
    _emailControler = TextEditingController();
    _passwordControler1 = TextEditingController();
    _passwordControler2 = TextEditingController();
    _dateinput = TextEditingController();
    _dniControler = TextEditingController();
    _celularControler = TextEditingController();

    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final loginProvider = Provider.of<AuthService>(context);
    DateTime selectedDate;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Registro",
              style: TextStyle(color: Color(0Xff180C5F))
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              padding : const EdgeInsets.fromLTRB(30, 5, 5, 5),
              onPressed: () {
                widget.toggleScreen!('LoginScreen');
              },
              icon: Icon(Icons.arrow_back, color: Color(0Xff180C5F))
          ),
        ),
        body: Container(
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
                        SizedBox(height: 11),
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
                                      controller: _nombreControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          hintText: "NOMBRE",
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _apellidoControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          hintText: "APELLIDO",
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _empresaControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          hintText: "EMPRESA",
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xfff3f3f3),
                                      hintText: 'ELEGIR LOCALIDAD',
                                    ),
                                    validator: (value) => value == null ? "Select a country" : null,
                                    value: _localidadControler,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _localidadControler = newValue!;
                                      });
                                    },
                                    items: <String>['marcos paz', 'moreno', 'merlo', 'ituzaingó', 'hurlingham', 'Morón']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _numAfiliadoControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          hintText: "Nº DE AFILIADO",
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _dniControler,
                                      validator: (val) => val!.length < 7 ? 'DNI invalido' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      maxLength: 9,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          hintText: "DNI",
                                          counterText: '',
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                    controller: _dateinput, //editing controller of this TextField
                                    decoration: InputDecoration(
                                        hintText: "FECHA DE NACIMIENTO (DD/MM/AA)",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true
                                    ),
                                    readOnly: true,  //set it true, so that user will not able to edit text
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context, initialDate: DateTime.now(),
                                          firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2101)
                                      );

                                      if(pickedDate != null ){
                                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement

                                        setState(() {
                                          _dateinput.text = formattedDate; //set output date to TextField value.
                                        });
                                      }else{
                                        print("Date is not selected");
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _celularControler,
                                      validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                      autocorrect: false,
                                      obscureText: false,
                                      maxLength: 11,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          hintText: "CELULAR",
                                          counterText: '',
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0,
                                  ),
                                  TextFormField(
                                      controller: _passwordControler1,
                                      keyboardType: TextInputType.visiblePassword,
                                      autocorrect: false,
                                      obscureText: _obscureText,
                                      validator: (val) => val!.isEmpty ? 'Password can\'t be empty.' : null,
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
                                          filled: true,
                                          suffixIcon: new GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            child:
                                            new Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color : Color(0XFFD6D0CC)),
                                          )
                                      )
                                  )
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
                                    controller: _passwordControler2,
                                    keyboardType: TextInputType.visiblePassword,
                                    autocorrect: false,
                                    obscureText: _obscureText,
                                    validator: (val) => val!.isEmpty ? 'Password can\'t be empty.' : null,
                                    decoration: InputDecoration(
                                        hintText: "REPITE TU CONTRASEÑA",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true,
                                        suffixIcon: new GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child:
                                          new Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color : Color(0XFFD6D0CC)),
                                        )
                                    )
                                  )
                                ],
                              ),
                            )
                          ],
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
                            //database
                            if (_formKey.currentState!.validate()) {
                              Map<String, String?> userInfo = {
                                'nombre': _nombreControler.text,
                                'apellido': _apellidoControler.text,
                                'empresa': _empresaControler.text,
                                'localidad': _localidadControler,
                                'numAfiliado': _numAfiliadoControler.text,
                                'dni': _dniControler.text,
                                'fechaNacimiento': _dateinput.text,
                                'celular': _celularControler.text,
                              };
                              await loginProvider.register(_emailControler.text, _passwordControler2.text, userInfo, context: context);
                            }

                            //widget.toggleScreen!('RegisterScreen');
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