import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../helper/Colorsys.dart';
import '../models/Post.dart';

class TakePictureScreen extends StatefulWidget {
  final Post post;
  const TakePictureScreen(
      {super.key, required this.camera, required this.post});

  final List<CameraDescription> camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late int index = 0;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera[index],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }
  //@override
  //setState(() { _myState = newValue; });

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colorsys.black,
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: Column(children:  [
          
          Stack(alignment: Alignment.bottomCenter, children: [
            Column(
              children: [
                Container(
                  height: 550,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the Future is complete, display the preview.
                        return CameraPreview(_controller);
                      } else {
                        // Otherwise, display a loading indicator.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                height: 90,
                width: 90,
                decoration:   BoxDecoration(
                    color: Colorsys.whitish, shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: const Color.fromARGB(255, 226, 223, 223).withOpacity(0.15),
                      spreadRadius: 10,
                      blurRadius: 15,
                      offset: const Offset(0, 3)

                    )]),
                    
                    ),

                Container(
                height: 75,
                width: 75,
                decoration:  BoxDecoration(
                    color: Colorsys.whitish, shape: BoxShape.circle , boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 15,
                      offset: const Offset(0, 3)

                    )]),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () async {
                      // Take the Picture in a try / catch block. If anything goes wrong,
                      // catch the error.
                      try {
                        // Ensure that the camera is initialized.
                        await _initializeControllerFuture;
            
                        // Attempt to take a picture and get the file `image`
                        // where it was saved.
                        final image = await _controller.takePicture();
            
                        if (!mounted) return;
            
                        // If the picture was taken, display it on a new screen.
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                              // Pass the automatically generated path to
                              // the DisplayPictureScreen widget.
                              imagePath: image.path,
                            ),
                          ),
                        );
                        widget.post.relatedPhotos.add(image.path);
            
                        debugPrint(image.path);
                      } catch (e) {
                        // If an error occurs, log the error to the console.
                        print(e);
                      }
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    )),
              ),
              ]
            ),
          ]),
          Container(
            transform: Matrix4.translationValues(150, -0, 0),
            height: 50,
            width: 50,
            decoration:  BoxDecoration(
              color: Colorsys.whitish,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                      color: const Color.fromARGB(255, 226, 223, 223).withOpacity(0.15),
                      spreadRadius: 10,
                      blurRadius: 15,
                      offset: const Offset(0, 3)

                    )]
            ),
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    index = (~index) & 1;
                    _controller = CameraController(
                      // Get a specific camera from the list of available cameras.
                      widget.camera[index],
                      // Define the resolution to use.
                      ResolutionPreset.medium,
                    );
                    _initializeControllerFuture = _controller.initialize();
                  });

                  debugPrint("flipflip");
                },
                icon: const Icon(
                  Icons.flip_camera_android_outlined,
                  color: Color.fromARGB(255, 64, 64, 64),
                )),
          ),
          
        ]),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
