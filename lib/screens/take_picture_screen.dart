import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:new2u_project/screens/display_picture_screen.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;
// }

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  static const routeName = '/take-picture-screen';

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  String imagePath;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();

    @override
    void dispose() {
      // Dispose of the controller when the widget is disposed.
      _controller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take a picture'),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await _initializeControllerFuture;

              // Construct the path where the image should be saved using the path
              // package.
              // final path = join(
              //   // Store the picture in the temp directory.
              //   // Find the temp directory using the `path_provider` plugin.
              //   (await getTemporaryDirectory()).path,
              //   '${DateTime.now()}.png',
              // );
              // print(path);

              // Attempt to take a picture and log where it's been saved.
              final xFile = await _controller.takePicture();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(xFile),
                ),
              );
              print(
                'FILE WHERE IMAGE IS STORED:' + xFile.path.toString(),
              );
            } catch (e) {
              // If an error occurs, log the error to the cosole.
              print(e);
            }
          }),
    );
  }
}
