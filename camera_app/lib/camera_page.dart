import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameras});

 final List<CameraDescription> cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
        CameraController(widget.cameras[0], ResolutionPreset.max, enableAudio: false);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      // print("INFO: ERROR: Camera error = $e");
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !controller.value.isInitialized ? Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
      body: Stack(
          children:[
            Positioned.fill(child: CameraPreview(controller)),
            Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Center(
                  child: InkWell(
                    onTap: () async{
                      XFile picture = await controller.takePicture();
                      Navigator.of(context).pop(picture);
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.white, size: 30,),
                    ),
                  ),
                )
            )
          ]
      ),
    );
  }
}
