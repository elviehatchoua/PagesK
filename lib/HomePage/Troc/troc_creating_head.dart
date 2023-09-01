import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:finology/Widgets/bottom_sheet.dart';

class TrocCreatingHead extends StatefulWidget {
  final Function _takeImagePath;
  const TrocCreatingHead(this._takeImagePath,{super.key});

  @override
  State<TrocCreatingHead> createState() => _TrocCreatingHeadState();
}

class _TrocCreatingHeadState extends State<TrocCreatingHead> {
  var imageFileHead;


 void photoFile (XFile imagePicked) {
   print(' --------------------image picked: $imagePicked');
    setState(() {
      imageFileHead = imagePicked;
      widget._takeImagePath(imageFileHead);
      
    });
   print(' --------------------image picked: $imageFileHead');

  
 }

  @override
  Widget build (BuildContext context) {
    return Stack (
                  clipBehavior: Clip.none, // les elements se cachent ou non
                  alignment: Alignment.center,
                  children: <Widget>[
                    imageFileHead == null 
                    ?
                      Container(
                          height: 150,
                          color: Colors.grey,
                    
                        )
                    : 
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Image.file( File(imageFileHead.path) , fit: BoxFit.cover),

                    ),
                    Positioned(
                        top: imageFileHead == null ? 120 : 230,
                        right:20,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor:  imageFileHead == null ? Colors.blue : Colors.grey,
                          child: InkWell(
                            onTap: () {
                              showBottomSheet(
                                context: context, 
                                builder: ((builder) =>  MyBottomSheet(photoFile))
                              );
                            },
                            child: const Icon(Icons.add_a_photo_outlined)
                          ),
                        ),
                      ), 
                   
                  ],
    );
  }
}
  /*                   Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage( File(imageFileHead.path)),fit: BoxFit.cover )
                      ),
                    ), */