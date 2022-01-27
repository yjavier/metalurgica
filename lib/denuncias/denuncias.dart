import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AfiliacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Afiliaciones",
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)
                            )
                          ),
                          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                          elevation: 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: width * .7,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 35, 5, 10),
                              child: Flexible(
                                  child: new Text(
                                    'En esta sección encontrás información de utilidad para compañeros y compañeras que quieran afiliarse o para modificaciones que tengas que realizar en tu afiliación actual.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w400),
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: (width/2) - 57,
                        child: RawMaterialButton(
                          constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                          onPressed: ()  async {
                          },
                          elevation: 5,
                          fillColor: Color(0XFF180C5F),
                          child: Image.asset('assets/document.png',
                              height: 25,
                              width: 25,
                              fit: BoxFit.fill
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ]
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 15, 5, 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: (width/2) - 125),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 14,
                            ),
                            SizedBox(width: 7),
                            GestureDetector(
                              onTap: () async {
                                const _url = "https://uommoron.org.ar/wp-content/uploads/2020/10/Formulario1.pdf";
                                if (!await launch(_url)) throw 'Could not launch $_url';
                              },
                              child: new Text('Formulario de Retención',
                                  style: new TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            SizedBox(width: (width/2) - 125),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 14,
                            ),
                            SizedBox(width: 7),
                            GestureDetector(
                              onTap: () async {
                                const _url = "https://uommoron.org.ar/wp-content/uploads/2020/10/formulario2.pdf";
                                if (!await launch(_url)) throw 'Could not launch $_url';
                              },
                              child: new Text('Formulario de Afiliación',
                                  style: new TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            SizedBox(width: (width/2) - 125),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 14,
                            ),
                            SizedBox(width: 7),
                            GestureDetector(
                              onTap: () async {
                                const _url = "https://uommoron.org.ar/wp-content/uploads/2020/10/formulario2.pdf";
                                if (!await launch(_url)) throw 'Could not launch $_url';
                              },
                              child: new Text('Formulario Complementario',
                                  style: new TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      decorationStyle: TextDecorationStyle.wavy,
                                      fontFamily: "Roboto",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Descargá estos formularios desde nuestro "
                                    ),
                                    TextSpan(
                                        style: TextStyle(decoration: TextDecoration.underline),
                                        text: "sitio web.",
                                        recognizer: TapGestureRecognizer()..onTap =  () async{
                                          const _url = "https://uommoron.org.ar/afiliaciones/";
                                          if (!await launch(_url)) throw 'Could not launch $_url';
                                        }
                                    ),
                                    TextSpan(
                                        text: " Seguí los pasos allí detallados y acercate al sindicato."
                                    )
                                  ]
                              )
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {

                              },
                              child: new Text('Compartir con un compañeros',
                                  style: new TextStyle(fontFamily: "Roboto", fontSize: 12, fontWeight: FontWeight.w400)
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(
                              FontAwesomeIcons.shareAlt,
                              size: 20,
                              color: Color(0XffF74C14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Text(
                      "Requisitos para afiliarse",
                      style: TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w500, color: Color(0Xff180C5F))
                  ),
              ),
              SizedBox(height: 7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "SOLTERO",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I.",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo ",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "SOLTERO CON HIJOS",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I. Titular e hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet titular",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Certificado de nacimiento hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Una (1) foto carnet hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "CASADO",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I.Titular y Cónyuge.",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet titular",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Certificado Matrimonio",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Una (1) foto carnet cónyuge",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "CASADO CON HIJOS",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I. Titular y familiares",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet titular",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Certificado Matrimonio",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Certificado nacimiento hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Una (1) foto carnet c/familiar",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "CONCUBINATO",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I.Titular y Cónyuge",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet titular",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Declaración jurada concubinato",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Una(1) foto carnet concubina",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Comprobante de empadronamiento (CODEM)",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: (width/2) - 125),
                  Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 14,
                  ),
                  SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "CONCUBINATO CON HIJOS",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                      Text(
                          "D.N.I. titular, concubina e hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Dos (2) fotos carnet titular",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Último recibo de sueldo",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Declaración jurada concubinato",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Certificado nacimiento hijo/s",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Una (1) foto carnet c/familiar",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      ),
                      Text(
                          "Comprobante de empadronamiento (CODEM)",
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                      )
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius:
                  BorderRadius.all(Radius.circular(10.0))
                  ),
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Flexible(
                          child: new Text(
                            'Si cambias de trabajo, debés presentarte en el sindicato para hacer el cambio de empresa.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w400),
                          )
                      ),
                    ),
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