// working with image files
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class CardInfoInput extends StatefulWidget {
  final Function onSelectImage;
  //const CardInfoInput({Key? key}) : super(key: key);
  const CardInfoInput(this.onSelectImage);

  @override
  _CardInfoInputState createState() => _CardInfoInputState();
}

class _CardInfoInputState extends State<CardInfoInput> {
   late File _storedImage;

Future <void> _takePicture() async {
  final picker = ImagePicker();
  final imageFile = await picker.getImage(source: ImageSource.camera, maxHeight: 600);
  setState(() {
    _storedImage = File(imageFile!.path);
  });
  final appDir = await syspaths.getApplicationDocumentsDirectory();
  final fileName = path.basename(imageFile!.path);
  final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
  //forward saved image on the widget
  widget.onSelectImage(savedImage);
}


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          // if stiredImage, create image based on a file.
          //fultter is responsible for finding, parsing and rendering the image.
          child: _storedImage != null
              ? Image.file(
                  // ! to add null check
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  "No Images taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        //give some spacing
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text("Take Picture"),
          ),
        )
      ],
    );
  }
}
