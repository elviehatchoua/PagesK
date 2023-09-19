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
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child:  Column(
        children: <Widget>[
          Container(
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Set the border radius
              color: Color.fromARGB(255, 165, 165, 168),
 // Set the color of the Divider
            ),
            child: Divider(
              height: 5, // height of the Divider
              thickness: 3, // thickness of the Divider
            ),
          ),
/*         SizedBox(
            width: 35, 
            child: Divider(
              height: 5, 
              thickness: 4, 
              color: Color.fromARGB(255, 165, 165, 168),
            )
          ), */
          SizedBox(
            height: 30,
          ),

          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:  Text('Choisis une photo', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                icon: Icon(Icons.close)
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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