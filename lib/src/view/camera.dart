import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

class Camera extends StatefulWidget {
  const Camera({Key key, this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController controller;
  @override
  void initState() {
    super.initState();
    if(widget.cameras.length > 0) {
      controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}
