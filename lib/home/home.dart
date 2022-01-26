import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60,width: width),
              RawMaterialButton(
                onPressed: () {},
                elevation: 0,
                fillColor: Color(0XFFF74C14),
                child: Icon(
                  Icons.home_outlined,
                  color: Color(0XFFFFFFFF),
                  size: 35.0,
                ),
                padding: EdgeInsets.all(20.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 60),
              Material(  //Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6) ),
                elevation: 5.0,
                color: Color(0xFFF74C14),
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 288,
                  height: 100,
                  color: Color(0xFFF74C14),
                  child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: new Text('DENUNCIAS',
                              style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF))
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 35,
                          child: Icon(
                            FontAwesomeIcons.thumbsDown,
                            color: Color(0XFFFFFFFF),
                            size: 30.0,
                          ),
                        ),
                      ]
                  ),
                  onPressed: () {
                  },
                ),
              ),
              SizedBox(height: 10),
              Material(  //Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6) ),
                elevation: 5.0,
                color: Color(0xFF46A761),
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 288,
                  height: 100,
                  color: Color(0xFF46A761),
                  child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: new Text('TELÉFONOS',
                              style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF))
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 35,
                          child: Icon(
                            Icons.local_phone_outlined,
                            color: Color(0XFFFFFFFF),
                            size: 32.0,
                          ),
                        ),
                      ]
                  ),
                  onPressed: () {
                  },
                ),
              ),
              SizedBox(height: 10),
              Material(  //Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6) ),
                elevation: 5.0,
                color: Color(0xFF180C5F),
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 288,
                  height: 100,
                  color: Color(0xFF180C5F),
                  child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: new Text('AFILIACIONES',
                              style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF))
                          ),
                        ),
                        Positioned(
                          bottom: 38,
                          left: 35,
                          child: Image.asset('assets/document.png',
                              height: 25,
                              width: 25,
                              fit: BoxFit.fill
                          ),
                        ),
                      ]
                  ),
                  onPressed: () {
                  },
                ),
              ),
              SizedBox(height: 10),
              Material(  //Wrap with Material
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6) ),
                elevation: 5.0,
                color: Color(0xFF737373),
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 288,
                  height: 100,
                  color: Color(0xFF737373),
                  child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: new Text('NOTICIAS',
                              style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF))
                          ),
                        ),
                        Positioned(
                          bottom: 38,
                          left: 35,
                          child: Image.asset('assets/newspaper.png',
                              height: 25,
                              width: 25,
                              fit: BoxFit.fill
                          ),
                        ),
                      ]
                  ),
                  onPressed: () {
                  },
                ),
              ),
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: new Text('Seguinos!',
                    style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF180C5F))
                ),
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RawMaterialButton(
                      constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Color(0XFF180C5F),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Color(0XFFF74C14),
                        size: 30.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Color(0XFF180C5F),
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        color: Color(0XFFF74C14),
                        size: 30.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Color(0XFF180C5F),
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        color: Color(0XFFF74C14),
                        size: 30.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Color(0XFF180C5F),
                      child: Icon(
                        FontAwesomeIcons.youtube,
                        color: Color(0XFFF74C14),
                        size: 30.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }

}