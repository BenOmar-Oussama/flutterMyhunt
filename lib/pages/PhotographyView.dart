import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

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
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        // leading: Icon(Icons.arrow_back_ios_new),
        // backgroundColor: Color.fromARGB(0, 255, 255, 255),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black)
        ),
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: Column(children: [
        Container(
          height: 550,
          width: 500,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(9.0))),
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
                  icon: Icon(
                    Icons.flip_camera_ios_outlined,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(9.0))),
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
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                  )),
            ),
          ],
        )
      ]),
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
