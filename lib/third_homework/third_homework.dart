import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_screen.dart';

class ThirdHomework extends StatefulWidget {
  const ThirdHomework({Key? key}) : super(key: key);

  final String title = "Third homework";

  @override
  _ThirdHomeworkState createState() => _ThirdHomeworkState();
}

class _ThirdHomeworkState extends State<ThirdHomework> {
  List<String> mediaList = [];

  //late File _image;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(mediaList.length, (index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        _showImage(index);
                      },
                      child: Image.file(File(mediaList[index]),
                          width: 200.0, height: 200.0, fit: BoxFit.fitHeight),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.camera),
                    iconSize: 50,
                    onPressed: () {
                      _addImageFromCamera();
                    },
                  ),
                  // Text('Camera');
                  IconButton(
                    icon: const Icon(Icons.image_rounded),
                    iconSize: 50,
                    onPressed: () {
                      _addImageFromGallery();
                    },
                  ),
                  // Text('Camera');
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addImageFromGallery() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50));

    setState(() {
      mediaList.add(image!.path);
    });
  }

  void _addImageFromCamera() async {
    XFile? image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50));
    setState(() {
      mediaList.add(image!.path);
    });
  }

  void _showImage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ImageScreen(imagePath: mediaList[index])));
  }
}
