import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../denuncias.dart';

class TakePictureScreen extends StatefulWidget {
  final camera;
  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> with WidgetsBindingObserver, TickerProviderStateMixin{
  late CameraController _cameraController;
  late Future<void> _initializeCameraControllerFuture;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late String vidPath;
  late String fileName = 'test';
  late int _selectedIndex = 0;
  late bool _start = true;
  late bool _isRec = false;

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);

    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );

    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);

    _initializeCameraControllerFuture = _cameraController.initialize();
    _fileInit();
  }

  void _onItemTapped(int index) {
    setState(() {
      if (!_isRec) {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: _initializeCameraControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    width: double.infinity,
                    height: height - 55,
                    child: CameraPreview(_cameraController));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          SafeArea(
            child: _modeControlRowWidget(context),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RawMaterialButton(
                  constraints:  BoxConstraints(minWidth: 75.0, minHeight: 20.0),
                  onPressed: () {
                    pictureAndVideo(context);
                  },
                  elevation: 6,
                  fillColor: Colors.orange,
                  child:
                  _selectedIndex == 0 ?
                        Icon(
                          Icons.camera,
                          size: 44,
                          color: Colors.white,
                        )
                      :
                    _isRec == true ?
                    Icon(
                      Icons.stop,
                      size: 44,
                      color: Colors.white,
                    ) :
                    Icon(
                      Icons.play_arrow,
                      size: 44,
                      color: Colors.white,
                    ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
          _isRec == true
              ? SafeArea(
            child: Container(
              height: 40,
              // alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Color(0xFFEE4400),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "REC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFFFAFAFA)),
                ),
              ),
            ),
          )
              : SizedBox(
            height: 0,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Picture'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            title: Text('Video'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
  Widget _modeControlRowWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.flash_on),
              color: Colors.blue,
              iconSize: 30,
              onPressed: _cameraController != null ? onFlashModeButtonPressed : null,
            ),
          ],
        ),
        _flashModeControlRowWidget(context)
      ],
    );
  }

  Widget _flashModeControlRowWidget(BuildContext context) {
    return SizeTransition(
      sizeFactor: _flashModeControlRowAnimation,
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.flash_off),
              color: _cameraController?.value.flashMode == FlashMode.off
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.off, context)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.flash_auto),
              color: _cameraController?.value.flashMode == FlashMode.auto
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.auto, context)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.flash_on),
              color: _cameraController?.value.flashMode == FlashMode.always
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.always, context)
                  : null,
            ),
            IconButton(
              icon: Icon(Icons.highlight),
              color: _cameraController?.value.flashMode == FlashMode.torch
                  ? Colors.orange
                  : Colors.blue,
              onPressed: _cameraController != null
                  ? () => onSetFlashModeButtonPressed(FlashMode.torch, context)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void onFlashModeButtonPressed() {
    if (_flashModeControlRowAnimationController.value == 1) {
      _flashModeControlRowAnimationController.reverse();
    } else {
      _flashModeControlRowAnimationController.forward();
    }
  }

  void onSetFlashModeButtonPressed(FlashMode mode, BuildContext context) {
    setFlashMode(mode, context).then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> setFlashMode(FlashMode mode, BuildContext context) async {
    if (_cameraController == null) {
      return;
    }

    try {
      await _cameraController!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e, context);
      rethrow;
    }
  }

  void _fileInit() async {
    vidPath = join((await getTemporaryDirectory()).path, '${fileName}.mp4');
  }

  void pictureAndVideo(BuildContext context) async {
    try {
      await _initializeCameraControllerFuture;

      if (_selectedIndex == 0) {
        onTakePictureButtonPressed(context);
      } else {
        if (_start) {
          setState(() {
            _start = !_start;
            _isRec = !_isRec;
          });
          onVideoRecordButtonPressed(context);
        } else {
          onStopButtonPressed(context);
          setState(() {
            _start = !_start;
            _isRec = !_isRec;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void onStopButtonPressed(BuildContext context) {
    stopVideoRecording(context).then((file) {
      if (mounted) setState(() {});
      if (file != null) {
        showInSnackBar('Video recorded to ${file.path}', context);
        final data = { "file" : file, "type" : _selectedIndex };
        Navigator.pop(context, data);
        /*videoFile = file;
        _startVideoPlayer();*/
      }
    });
  }

  void onVideoRecordButtonPressed(BuildContext context) {
    startVideoRecording(context).then((_) {
      if (mounted) setState(() {});
    });
  }

  void onTakePictureButtonPressed(BuildContext context) {
    takePicture(context).then((XFile? file) {
      if (mounted) {
        setState(() {

          /*imageFile = file;
          videoController?.dispose();
          videoController = null;*/
        });
        if (file != null) showInSnackBar('Picture saved to ${file.path}', context);
        final data = { "file" : file, "type" : _selectedIndex };
        Navigator.pop(context, data); // _selectedIndex
      }
    });
  }

  Future<void> startVideoRecording(BuildContext context) async {
    final CameraController? cameraController = _cameraController;

    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.', context);
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e, context);
      return;
    }
  }

  Future<XFile?> stopVideoRecording(BuildContext context) async {
    final CameraController? cameraController = _cameraController;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e, context);
      return null;
    }
  }

  Future<XFile?> takePicture(BuildContext context) async {
    final CameraController? cameraController = _cameraController;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.', context);
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e, context);
      return null;
    }
  }

  void _showCameraException(CameraException e, BuildContext context) {
    //logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}', context);
  }

  void showInSnackBar(String value, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }


  @override
  void dispose() {
    _flashModeControlRowAnimationController.dispose();
    _cameraController.dispose();
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.dispose();
  }

}

T? _ambiguate<T>(T? value) => value;