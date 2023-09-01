import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
class MyBottomSheet extends StatefulWidget{
    final Function _photoFile;
    const MyBottomSheet(this._photoFile,{super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  late XFile imageFile;
  final ImagePicker _picker = ImagePicker();

  void _takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source,);
    setState(() {
      imageFile = pickedFile!;
      widget._photoFile(imageFile);
      Navigator.of(context).pop();

    });
  }
    @override
  Widget build (BuildContext context) { 
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child:  Column(
        children: <Widget>[
          const Text('Choose Profile photo',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: ()=> _takePhoto(ImageSource.camera),
                icon: const Icon(Icons.camera), 
                label: const Text("Camera")
              ),
              ElevatedButton.icon(
                onPressed:() => _takePhoto(ImageSource.gallery),
                icon: const Icon(Icons.image), 
                label: const Text("Gallery")
              )
            ],
          )
        ],
      ),
    );
  }
}