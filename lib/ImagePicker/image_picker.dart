import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? file;
  Future chooseImage(ImageSource source) async {
    var result = await ImagePicker()
        .pickImage(source: source, maxWidth: 800, maxHeight: 600);
    setState(() {
      file = File(result!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker Section"),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: file != null
                ? Image.file(file!)
                : Image.asset(
                    "assets/images/upload.png",
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () => chooseImage(ImageSource.camera),
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () => chooseImage(ImageSource.gallery),
                    icon: Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
