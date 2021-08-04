import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class uploadPage extends StatefulWidget {
  @override
  _uploadPageState createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  /// Active image file
  //late File _imageFile;

  /// Cropper plugin
  /*Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It'
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }*/

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      //_;//imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => uploadPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(children: <Widget>[
        /*if (_imageFile != null) ...[
            Image.file(_imageFile),?*/

        Row(
          children: <Widget>[
            FlatButton(child: Icon(Icons.crop), onPressed: () {} //_cropImage,
            ),
            FlatButton(child: Icon(Icons.refresh), onPressed: () {} //_clear,
            ),
          ],
        ),

        //Uploader(file: _imageFile)
      ]
        //],
      ),
    );
  }
}
