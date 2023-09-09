import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:bleslive/main.dart';
import 'package:bleslive/screens/archieves/archieves.dart';
import 'package:bleslive/screens/session/analytics.dart';
import 'package:bleslive/screens/session/products.dart'; 
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_player/video_player.dart';
 

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}



class _CameraScreenState extends State<CameraScreen>  with WidgetsBindingObserver {

  CameraController? controller;
  VideoPlayerController? videoController;

  File? _imageFile;
  File? _videoFile;

  // Initial values
  bool _isCameraInitialized = false;
  bool _isCameraPermissionGranted = false;
  bool _isRearCameraSelected = true;
  bool _isVideoCameraSelected = false;
  bool _isRecordingInProgress = false;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;

  // Current values
  double _currentZoomLevel = 1.0;
  double _currentExposureOffset = 0.0;
  FlashMode? _currentFlashMode;

  List<File> allFileList = [];

  final resolutionPresets = ResolutionPreset.values;

  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      log('Camera Permission: GRANTED');
      setState(() {
        _isCameraPermissionGranted = true;
      });
      // Set and initialize the new camera
      onNewCameraSelected(cameras[0]);
      refreshAlreadyCapturedImages();
    } else {
      log('Camera Permission: DENIED');
    }
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();
    List<Map<int, dynamic>> fileNames = [];

    fileList.forEach((file) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    });

    if (fileNames.isNotEmpty) {
      final recentFile =
      fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
      String recentFileName = recentFile[1];
      if (recentFileName.contains('.mp4')) {
        _videoFile = File('${directory.path}/$recentFileName');
        _imageFile = null;
        _startVideoPlayer();
      } else {
        _imageFile = File('${directory.path}/$recentFileName');
        _videoFile = null;
      }

      setState(() {});
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  Future<void> _startVideoPlayer() async {
    if (_videoFile != null) {
      videoController = VideoPlayerController.file(_videoFile!);
      await videoController!.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
      await videoController!.setLooping(true);
      await videoController!.play();
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (controller!.value.isRecordingVideo) {
      // A recording has already started, do nothing.
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      setState(() {
        _isRecordingInProgress = true;
        print(_isRecordingInProgress);
      });
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }

    try {
      XFile file = await controller!.stopVideoRecording();
      setState(() {
        _isRecordingInProgress = false;
      });
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Video recording is not in progress
      return;
    }

    try {
      await controller!.pauseVideoRecording();
    } on CameraException catch (e) {
      print('Error pausing video recording: $e');
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // No video recording was in progress
      return;
    }

    try {
      await controller!.resumeVideoRecording();
    } on CameraException catch (e) {
      print('Error resuming video recording: $e');
    }
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
    _currentExposureOffset = 0.0;
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController
            .getMinExposureOffset()
            .then((value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  final CameraController? cameraController = controller;

  // App state changed before we got the chance to initialize.
  if (cameraController == null || !cameraController.value.isInitialized) {
  return;
  }

  if (state == AppLifecycleState.inactive) {
  // Free up memory when camera not active
  cameraController.dispose();
  } else if (state == AppLifecycleState.resumed) {
  // Reinitialize the camera with same properties
  onNewCameraSelected(cameraController.description);
  }
  }



  @override
  void initState() {
    // Hide the status bar
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    getPermissionStatus();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    videoController?.dispose();
    super.dispose();
  }


  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Text(
                    'Live video has ended!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.cancel,
                      color: Color(0xFF000000),
                      size: 54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_call,
                    color: Color(0xFF52C41A),
                    size: 54,
                  ),
                  // SizedBox(width: 1),
                  Icon(
                    Icons.person,
                    color: Color(0xFFE9F2E6),
                    size: 54,
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  _showBlurredModal(context);
                },
                child:    Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: analytics(),pageTransitionAnimation:PageTransitionAnimation.scale);
                            },
                            child: Card(
                              margin:
                              const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                              child: const ListTile(
                                leading: Icon(
                                  Icons.checklist_rounded,
                                  color: Color(0xFF3B7425),
                                ),
                                title: Text(
                                  'View Insight analytics',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color(0xFF3C3C43),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: Archieves(),pageTransitionAnimation:PageTransitionAnimation.scale);
                            },
                            child: Card(
                              margin:
                              const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                              child: const ListTile(
                                leading: Icon(
                                  Icons.video_camera_back_outlined,
                                  color: Color(0xFF3B7425),
                                ),
                                title: Text(
                                  'View in archieves',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color(0xFF3C3C43),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                )
              ),
            ],
          ),
        );
      },
    );
  }

  void OpenBottomNow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(),
                  Text(
                    'SETTINGS',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                  child:    Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            InkWell(
                              child: Card(
                                margin:
                                const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.comment,
                                    color: Color(0xFF3B7425),
                                  ),
                                  title: Text(
                                    'Comments',
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Icon(
                                    Icons.toggle_on_outlined,
                                    color: Color(0xFF3C3C43),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  )
              ),
            ],
          ),
        );
      },
    );
  }





  void _showBlurredModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          // Adjust blur strength
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0), // Adjust border radius
            ),
            title: Text('Are you sure you want to end your live video?',  style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();// Close the dialog
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Not Now", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3B7425))),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 24,
                      width: 1, // Adjust width as needed
                      color: Colors.grey, // Adjust color as needed
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _openBottomSheet(context);
                      },
                      child: Text('End Video', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3B7425))),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _isCameraPermissionGranted
            ? _isCameraInitialized
            ? Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / controller!.value.aspectRatio,
              child: Stack(
                children: [
                  CameraPreview(
                    controller!,
                    child: LayoutBuilder(builder:
                        (BuildContext context,
                        BoxConstraints constraints) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: (details) =>
                            onViewFinderTap(details, constraints),
                      );
                    }),
                  ),
                  // TODO: Uncomment to preview the overlay
                  // Center(
                  //   child: Image.asset(
                  //     'assets/camera_aim.png',
                  //     color: Colors.greenAccent,
                  //     width: 150,
                  //     height: 150,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      8.0,
                      16.0,
                      8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                  ),
                                  child:                           InkWell(
                                    onTap: () async {
                                      _showBlurredModal(context);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      size: 42,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _currentFlashMode = FlashMode.off;
                                          });
                                          await controller!.setFlashMode(
                                            FlashMode.off,
                                          );
                                        },
                                        child: Icon(
                                          Icons.flash_off,
                                          color:
                                          _currentFlashMode == FlashMode.off
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _currentFlashMode = FlashMode.auto;
                                          });
                                          await controller!.setFlashMode(
                                            FlashMode.auto,
                                          );
                                        },
                                        child: Icon(
                                          Icons.flash_auto,
                                          color:
                                          _currentFlashMode == FlashMode.auto
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _currentFlashMode = FlashMode.always;
                                          });
                                          await controller!.setFlashMode(
                                            FlashMode.always,
                                          );
                                        },
                                        child: Icon(
                                          Icons.flash_on,
                                          color: _currentFlashMode ==
                                              FlashMode.always
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _currentFlashMode = FlashMode.torch;
                                          });
                                          await controller!.setFlashMode(
                                            FlashMode.torch,
                                          );
                                        },
                                        child: Icon(
                                          Icons.highlight,
                                          color:
                                          _currentFlashMode == FlashMode.torch
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 7.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                              BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Icon(
                                Icons.mic_none_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                              BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Icon(
                                Icons.calendar_month_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                              BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            OpenBottomNow(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Icon(
                                  Icons.comment,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),


                        Expanded(
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Container(
                              height: 0,

                            ),
                          ),
                        ),


                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              onTap: _isRecordingInProgress
                                  ? () async {
                                if (controller!
                                    .value.isRecordingPaused) {
                                  await resumeVideoRecording();
                                } else {
                                  await pauseVideoRecording();
                                }
                              }
                                  : () {
                                setState(() {
                                  _isCameraInitialized = false;
                                });
                                onNewCameraSelected(cameras[
                                _isRearCameraSelected
                                    ? 1
                                    : 0]);
                                setState(() {
                                  _isRearCameraSelected =
                                  !_isRearCameraSelected;
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                      Icon(
                                        Icons.person,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Products(context);
                              },
                              // onTap: _isVideoCameraSelected
                              //     ? () async {
                              //   if (_isRecordingInProgress) {
                              //     XFile? rawVideo =
                              //     await stopVideoRecording();
                              //     File videoFile =
                              //     File(rawVideo!.path);
                              //
                              //     int currentUnix = DateTime
                              //         .now()
                              //         .millisecondsSinceEpoch;
                              //
                              //     final directory =
                              //     await getApplicationDocumentsDirectory();
                              //
                              //     String fileFormat = videoFile
                              //         .path
                              //         .split('.')
                              //         .last;
                              //
                              //     _videoFile =
                              //     await videoFile.copy(
                              //       '${directory.path}/$currentUnix.$fileFormat',
                              //     );
                              //
                              //     _startVideoPlayer();
                              //   } else {
                              //     await startVideoRecording();
                              //   }
                              // }
                              //     : () async {
                              //   XFile? rawImage =
                              //   await takePicture();
                              //   File imageFile =
                              //   File(rawImage!.path);
                              //
                              //   int currentUnix = DateTime.now()
                              //       .millisecondsSinceEpoch;
                              //
                              //   final directory =
                              //   await getApplicationDocumentsDirectory();
                              //
                              //   String fileFormat = imageFile
                              //       .path
                              //       .split('.')
                              //       .last;
                              //
                              //   print(fileFormat);
                              //
                              //   await imageFile.copy(
                              //     '${directory.path}/$currentUnix.$fileFormat',
                              //   );
                              //
                              //   refreshAlreadyCapturedImages();
                              // },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: _isVideoCameraSelected
                                        ? Colors.white
                                        : Color(0xff257A00),
                                    size: 80,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: _isVideoCameraSelected
                                        ? Colors.red
                                        : Color(0xff257A00),
                                    size: 65,
                                  ),Text( textAlign: TextAlign.start,
                                    'Go Live!',
                                    style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight:FontWeight.w500 ),),
                                  _isVideoCameraSelected &&
                                      _isRecordingInProgress
                                      ? Icon(
                                    Icons.stop_rounded,
                                    color: Colors.white,
                                    size: 32,
                                  )
                                      : Container(),
                                ],
                              ),
                            ),



                            InkWell(
                              onTap: _isRecordingInProgress
                                  ? () async {
                                if (controller!
                                    .value.isRecordingPaused) {
                                  await resumeVideoRecording();
                                } else {
                                  await pauseVideoRecording();
                                }
                              }
                                  : () {
                                setState(() {
                                  _isCameraInitialized = false;
                                });
                                onNewCameraSelected(cameras[
                                _isRearCameraSelected
                                    ? 1
                                    : 0]);
                                setState(() {
                                  _isRearCameraSelected =
                                  !_isRearCameraSelected;
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black38,
                                    size: 60,
                                  ),
                                  _isRecordingInProgress
                                      ? controller!
                                      .value.isRecordingPaused
                                      ? Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 35,
                                  )
                                      : Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                      : Icon(
                                    _isRearCameraSelected
                                        ? Icons.cameraswitch_outlined
                                        : Icons.cameraswitch_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 4.0,
                              ),
                              child: TextButton(
                                onPressed: _isRecordingInProgress
                                    ? null
                                    : () {
                                  if (_isVideoCameraSelected) {
                                    setState(() {
                                      _isVideoCameraSelected =
                                      false;
                                    });
                                  }
                                },
                                style: TextButton.styleFrom(
                                  primary: _isVideoCameraSelected
                                      ? Colors.black54
                                      : Colors.black,
                                  backgroundColor:
                                  _isVideoCameraSelected
                                      ? Colors.white30
                                      : Colors.white,
                                ),
                                child: Text('IMAGE'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, right: 8.0),
                              child: TextButton(
                                onPressed: () {
                                  if (!_isVideoCameraSelected) {
                                    setState(() {
                                      _isVideoCameraSelected = true;
                                    });
                                  }
                                },
                                style: TextButton.styleFrom(
                                  primary: _isVideoCameraSelected
                                      ? Colors.black
                                      : Colors.black54,
                                  backgroundColor:
                                  _isVideoCameraSelected
                                      ? Colors.white
                                      : Colors.white30,
                                ),
                                child: Text('VIDEO'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
            : Center(
          child: Text(
            'LOADING',
            style: TextStyle(color: Colors.white),
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Text(
              'Permission denied',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                getPermissionStatus();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Give permission',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
