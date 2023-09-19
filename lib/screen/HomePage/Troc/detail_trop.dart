import 'dart:io';
import 'package:finology/screen/Widgets/troc_description.dart';
import 'package:finology/screen/Widgets/user_idea.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import '../../Widgets/widgets.dart';

class DetailTrop extends StatefulWidget {
  const DetailTrop({Key? key}) : super(key: key);

  @override
  _DetailTropState createState() => _DetailTropState();
}

class _DetailTropState extends State<DetailTrop> {
  bool _showWidgets = true;

  @override
  Widget build(BuildContext context) {
    var imgTroc = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if(_showWidgets)...[
            AppBarIcons(iconColor: Colors.white),

          ]
          
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _showWidgets = !_showWidgets;
              });
            },
            child: Center(
              child: SizedBox(
                height: 450,
                child: imgTroc['image'] is String
                    ? PhotoView(
                        imageProvider: AssetImage(imgTroc['image']),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2.0,
                      )
                    : PhotoView(
                        imageProvider:
                            FileImage(File(imgTroc['image'].path)),
                      ),
              ),
            ),
          ),
          if (_showWidgets) ...[
            Positioned(
              top: 450,
              left: 1,
              bottom: 10,
              right: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                color: Colors.black26,
                child: TrocDescription(
                  commentaire: imgTroc['commentaire'],
                  objetARecevoir: imgTroc['attendu'],
                  valeurNet: imgTroc['valeur'],
                  myTextColor: Colors.white,
                  myTrim: 3,
                ),
              ),
            ),
            Positioned(
              top: 620,
              child: UserIdea(
                myTextColor: Colors.white,
                iconColor: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
