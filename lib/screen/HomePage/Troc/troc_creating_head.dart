import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:finology/screen/Widgets/bottom_sheet.dart';

class TrocCreatingHead extends StatefulWidget {
  //final Function _takeImagePath;
  var imageFileHead;
  bool  isReceive = false;
  TrocCreatingHead(this.imageFileHead,this.isReceive,{super.key});

  @override
  State<TrocCreatingHead> createState() => _TrocCreatingHeadState();
}

class _TrocCreatingHeadState extends State<TrocCreatingHead> {


 void photoFile (XFile imagePicked) {
   print(' --------------------image picked: $imagePicked');
    setState(() {
        widget.imageFileHead = imagePicked;
      //widget._takeImagePath(imageFileHead);
      
    });
  // print(' --------------------image file Head*************: $imageFileHead');

  
 }

  @override
  Widget build (BuildContext context) {
    return Stack (
                  clipBehavior: Clip.none, // les elements se cachent ou non
                  alignment: Alignment.center,
                  children: <Widget>[
                      widget.imageFileHead == null 
                    ?
                      Container(
                          height: 150,
                          color: Colors.grey,
                    
                        )
                    : 
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: widget.isReceive 
                      ?
                       Image.asset( widget.imageFileHead,fit: BoxFit.cover)
                      :
                       Image.file( File(  widget.imageFileHead.path) , fit: BoxFit.cover),

                    ),
                    Positioned(
                        top:   widget.imageFileHead == null ? 120 : 230,
                        right:20,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor:    widget.imageFileHead == null ? Colors.blue : Colors.grey,
                          child: InkWell(
                            onTap: () {
                              showBottomSheet(
                                elevation:10,
                                backgroundColor : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50)
                                  )
                                ),
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