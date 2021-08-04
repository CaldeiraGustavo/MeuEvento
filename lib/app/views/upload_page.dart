import 'package:flutter/material.dart';

class uploadPage extends StatefulWidget {
  @override
  _uploadPageState createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () {} //_pickImage(ImageSource.camera),
                ),
            IconButton(
                icon: Icon(Icons.photo_library),
                onPressed: () {} //_pickImage(ImageSource.gallery),
                ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(children: <Widget>[
        /*if (_imageFile != null) ...[

            Image.file(_imageFile),*/

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
