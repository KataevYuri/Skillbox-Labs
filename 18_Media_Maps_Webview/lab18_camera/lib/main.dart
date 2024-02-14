import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  late List<CameraDescription> cameras;
  CameraController? controller;
  XFile? lastImage;
  List<Image> imagesList = [];

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab #18.1 - Camera Example'),
        ),
        body: _selectedIndex == 0
            ? Center(
                child: controller != null && controller!.value.isInitialized
                    ? Center(
                        child: Stack(children: [
                        CameraPreview(controller!),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                            iconSize: 48,
                            icon: const Icon(
                              Icons.camera,
                            ),
                            onPressed: () async {
                              lastImage = await controller?.takePicture();
                              imagesList.add(Image.file(File(lastImage!.path)));
                            },
                          ),
                        )
                      ]))
                    : const SizedBox(),
              )
            : GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                children: imagesList,
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_enhance), label: "Camera"),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_album), label: "Album"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Future<void>? initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller!.initialize();
    setState(() {});
  }
}
