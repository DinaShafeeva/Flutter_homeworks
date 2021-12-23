import 'dart:developer';
import 'dart:io';

import 'package:fl_homework/fourth_homework/store.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as dartpath;

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key, required this.postsStore})
      : super(key: key);

  final PostsStore postsStore;

  final String title = "Добавить новый пост";

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _descriptionController = TextEditingController();
  PickedFile? file;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Придумай описание'),
                  controller: _descriptionController,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 70, right: 70),
              child: buildImageOrButtonWidget(),
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
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () { _savePost(); },
              child: const Text('Опубликовать!'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageOrButtonWidget() {
    if (file == null) {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: ClipRRect(
            child: Container(
                width: 300,
                height: 300,
                child: const Icon(Icons.add, color: Colors.black)),
          ),
        ),
      );
    } else {
      return Image.file(
        File(file!.path),
        width: 300,
        height: 300,
      );
    }
  }

  void _addImageFromGallery() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      file = image;
    });
  }

  void _addImageFromCamera() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      file = image;
    });
  }

  void _savePost() async {
    if (file != null) {
      File tmpFile = File(file!.path);
      final Directory directory =
          await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String fileName = dartpath.basename(file!.path);
      final String fileExtension =
      dartpath.extension(file!.path);
      tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');
      widget.postsStore.addPost(tmpFile.path, _descriptionController.text);
      Navigator.pop(context);
    }
  }
}
