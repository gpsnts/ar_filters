import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ARFaceView extends StatefulWidget
{
  String filterSelected;

  ARFaceView({super.key, required this.filterSelected,});

  @override
  State<ARFaceView> createState() => _ARFaceViewState();
}

class _ARFaceViewState extends State<ARFaceView>
{
  ArCoreFaceController? faceController;

  whenARCoreFaceViewCreated(ArCoreFaceController coreFaceController)
  {
    faceController = coreFaceController;
    applyFilterOnDetectedFace();
  }

  applyFilterOnDetectedFace() async
  {
    final ByteData bytesOfFilterImage = await rootBundle.load(widget.filterSelected);

    faceController!.loadMesh(
      textureBytes: bytesOfFilterImage.buffer.asUint8List(),
      skin3DModelFilename: "default"
    );
  }

  @override
  void dispose() {
    faceController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("AR Face View"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
      ),
      body: ArCoreFaceView(
        onArCoreViewCreated: whenARCoreFaceViewCreated,
        enableAugmentedFaces: true,
      ),
    );
  }
}
