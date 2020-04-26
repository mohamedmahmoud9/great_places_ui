import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery, );
        if(imageFile==null){
          return;
        }
        setState(() {
          _storedImage = imageFile;
        });
            final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(border: Border.all(width:1,color:Colors.grey)),
          width: double.infinity,
          height: 300,
          child: _storedImage != null
              ? Image.file(_storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : Center(child: Text('No image taken')),
        ),
        Positioned(
            right:20,
            bottom:20,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: _takePicture,
              child: Icon(Icons.camera),
            ))
      ],
    );
  }
}
