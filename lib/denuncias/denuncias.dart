import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metalurgica/denuncias/take-picture/takePicture.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';


class DenunciasScreen extends StatefulWidget {

  @override
  _DenunciasScreenState createState() => _DenunciasScreenState();
}

class _DenunciasScreenState extends State<DenunciasScreen> {
  bool isPause = false;
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;
  XFile? imageFile;
  XFile? videoFile;
  static final _formKey = new GlobalKey<FormState>();
  TextEditingController _emailControler  = TextEditingController();
  TextEditingController _passwordControler  = TextEditingController();

  _launchCamera() {
    _showCamera();
  }

  _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    if (videoController != null) {
      videoController!.pause();
      isPause = true;
    }
    final data = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TakePictureScreen(camera: camera))
    );
    setState(() {
      if (data != null) {
        imageFile = null;
        videoFile = null;

        if (data["type"] == 0) {
          imageFile = data["file"];
          videoController?.dispose();
          videoController = null;
        } else {
          videoFile = data["file"];
          _startVideoPlayer();
        }
      }
    });


  }

  @override
  void initState() {
    _emailControler = TextEditingController();
    _passwordControler = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Denuncias",
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
      bottomSheet: GestureDetector(
        onTap: () async {
        },
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: 60,
          decoration: BoxDecoration(color: Color(0XFF180C5F)),
          child: Text(
            'PRIVACIDAD',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0XFFF74C14),
            ),
          ),
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
                          BorderRadius.all(Radius.circular(10.0))
                          ),
                          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                          elevation: 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: width * .7,
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(14, 45, 14, 14),
                              child: Flexible(
                                  child: new Text(
                                    'Este es un espacio seguro para que puedas expresarte sobre tus condiciones laborales.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w500),
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
                          fillColor: Color(0XFFF74C14),
                          child: Icon(
                            FontAwesomeIcons.thumbsDown,
                            color: Color(0XFFFFFFFF),
                            size: 30.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                width: width,
                child: Form(
                  key: _formKey,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 22),
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
                                                hintText: "Nombre de la fábrica donde trabajas",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: Color(0xffffffff),
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
                                            controller: _emailControler,
                                            validator: (val) => val!.isEmpty ? 'Email can\'t be empty.' : null,
                                            autocorrect: false,
                                            obscureText: false,
                                            keyboardType: TextInputType.multiline,
                                            textInputAction: TextInputAction.newline,
                                            minLines: 10,
                                            maxLines: 300,
                                            decoration: InputDecoration(
                                                hintText: "denuncia",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: Color(0xffffffff),
                                                filled: true))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                                    child: Text(
                                        "TOMAR UNA FOTO O VIDEO DE REFERENCIA",
                                        style: TextStyle(fontFamily: "Roboto", fontSize: 12)
                                    ),
                                  ),
                                  RawMaterialButton(
                                    constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                                    onPressed: ()  async {
                                      _launchCamera();
                                    },
                                    elevation: 5,
                                    fillColor: Color(0XFF000000),
                                    child: Icon(
                                      Icons.photo_camera_outlined,
                                      color: Color(0XFFCCCCCC),
                                      size: 30.0,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        _thumbnailWidget(),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Material(  //Wrap with Material
                                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6) ),
                                    elevation: 5.0,
                                    color: Color(0xFFF74C14),
                                    clipBehavior: Clip.antiAlias, // Add This
                                    child: MaterialButton(
                                      minWidth: 288,
                                      height: 46,
                                      color: Color(0xFFF74C14),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        height: 46,
                                        margin: EdgeInsets.symmetric(vertical: 0),
                                        child: new Text('DENUNCIAS',
                                            style: new TextStyle(fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF))
                                        ),
                                      ),
                                      onPressed: () {
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 85),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _thumbnailWidget() {
    final VideoPlayerController? localVideoController = videoController;

    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            localVideoController == null && imageFile == null
                ? Container()
                : SizedBox(
              child: (localVideoController == null)
                  ? (
                  // The captured image on the web contains a network-accessible URL
                  // pointing to a location within the browser. It may be displayed
                  // either with Image.network or Image.memory after loading the image
                  // bytes to memory.
                  kIsWeb
                      ? Image.network(imageFile!.path)
                      : Image.file(File(imageFile!.path)))
                  : GestureDetector(
                      onTap: () async {
                        if (isPause) {
                          if (videoController != null) {
                            videoController!.play();
                          }
                        } else {
                          if (videoController != null) {
                            videoController!.pause();
                          }
                        }
                        isPause = !isPause;
                      },
                      child: Container(
                        child: Center(
                          child: AspectRatio(
                              aspectRatio:
                              localVideoController.value.size != null
                                  ? localVideoController
                                  .value.aspectRatio
                                  : 1.0,
                              child: VideoPlayer(localVideoController)),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                      )
                  ),
              width: 100.0,
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startVideoPlayer() async {
    if (videoFile == null) {
      return;
    }

    final VideoPlayerController vController = kIsWeb
        ? VideoPlayerController.network(videoFile!.path)
        : VideoPlayerController.file(File(videoFile!.path));

    videoPlayerListener = () {
      if (videoController != null && videoController!.value.size != null) {
        // Refreshing the state to update video player with the correct ratio.
        if (mounted) setState(() {});
        videoController!.removeListener(videoPlayerListener!);
      }
    };
    vController!.addListener(videoPlayerListener!);
    await vController!.setLooping(true);
    await vController!.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        imageFile = null;
        videoController = vController;
      });
    }
    isPause = false;
    await vController!.play();
  }

  @override
  void dispose() {
    if (videoController != null) {
      videoController!.dispose();
    }
    super.dispose();
  }

}