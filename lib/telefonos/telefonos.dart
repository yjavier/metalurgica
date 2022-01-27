import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metalurgica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TelefonosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Teléfonos",
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
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {},
                elevation: 0,
                fillColor: Color(0XFFE70B0B),
                child: Icon(
                  Icons.local_phone_outlined,
                  color: Color(0XFFFFFFFF),
                  size: 35.0,
                ),
                padding: EdgeInsets.all(20.0),
                shape: CircleBorder(),
              ),
              SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: new Text('EMERGENCIAS',
                    style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFE70B0B))
                ),
              ),
              new Divider(
                color: Colors.red,
                thickness: 2,
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('0810-333-1349',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -5,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFFE70B0B),
                          size: 30.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://08103331349");
                },
              ),
              SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: new Text('Clínica Evita Merlo',
                    style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                ),
              ),
              new Divider(
                color: Color(0XFFC4C4C4),
                thickness: 2,
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('11 5458-8242',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("https://wa.me/+5491154588242");
                },
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('(0220) 481-3378',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://02204813378");
                },
              ),
              SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: new Text('CETET Haedo',
                    style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                ),
              ),
              new Divider(
                color: Color(0XFFC4C4C4),
                thickness: 2,
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('11 4443-2577',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://1144432577");
                },
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('11 4443-0624',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://1144430624");
                },
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('11 4443-9706',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://1144439706");
                },
              ),
              SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                width: width,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: new Text('Clínica Mariano Moreno',
                    style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                ),
              ),
              new Divider(
                color: Color(0XFFC4C4C4),
                thickness: 2,
              ),
              MaterialButton(
                elevation: 0,
                child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: new Text('(0237) 462-2890',
                            style: new TextStyle(fontFamily: "Roboto", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF000000))
                        ),
                      ),
                      Positioned(
                        top: -2,
                        left: 35,
                        child: Icon(
                          Icons.local_phone_outlined,
                          color: Color(0XFF46A761),
                          size: 25.0,
                        ),
                      ),
                    ]
                ),
                onPressed: () {
                  launch("tel://02374622890");
                },
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

}