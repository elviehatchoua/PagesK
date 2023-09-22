import 'dart:io'; 
import 'package:finology/Constance/helpers.dart';
import 'package:finology/providers/troc_provider.dart';
import 'package:finology/screen/HomePage/Troc/troc_crud.dart';
import 'package:finology/screen/Widgets/troc_description.dart';
import 'package:finology/screen/Widgets/user_idea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';

class TrocItem extends StatefulWidget {
  final String userName;
  final double valeurNet;
  final String ? idTroc;
  final String objetARecevoir;
  final String commentaire;
  bool isPersonal =false;
   var imageTroc;


    TrocItem({
      required this.isPersonal,
      required this.commentaire,
      required this.objetARecevoir,
      required this.valeurNet ,
       this.idTroc,
      required this.imageTroc, 
      required this.userName ,super.key
    });

  @override
  State<TrocItem> createState() => _TrocItemState();
}

class _TrocItemState extends State<TrocItem> {

 // bool isVoirPlus = true;
  @override
  Widget build(BuildContext context) {

    //final myMaxLIne = isVoirPlus ? null : 1;
     var TextTheme = Theme.of(context).textTheme;
   //var MediaQueryWidth = MediaQuery.of(context).size.width;
   var MediaQueryHeight = MediaQuery.of(context).size.height;
    return  Container(
              margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
              width: double.infinity,
              height: 550,
              color: Colors.white,
              child:  Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left : 16.0, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(widget.isPersonal== false)
                              {
                                Navigator.pushNamed(context, 
                                  Routes.personnalpage, arguments: {'trocId':widget.idTroc, 'name': widget.userName}
                                );
                              }
                            },
                            child: const CircleAvatar(radius : 23)
                          ),
                          const SizedBox(width: 5,),
                           Text(widget.userName),
                          const Spacer(),
                          //const Icon(Icons.more_horiz)
                    PopupMenuButton(
                      itemBuilder: (context) =>[
                         PopupMenuItem(
                          value: "modifier",
                          onTap: () {
                            push(
                              context, TrocCreation(trocId:widget.idTroc, isEdit: true,)
                            );
                          },
                          child: Text("modifier"),
                        ),
                        PopupMenuItem  (
                          value: "Supprimer",
                          onTap: () {
                            Provider.of<TrocProvider>(context, listen: false)
                              .deleteTroc(widget.idTroc);
                          },
                          child:  Text("supprimer"),
                        ),
                      ],
                onSelected: (String newValue) {}
              )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 16.0, bottom: 8),
                      child: TrocDescription(
                        commentaire: widget.commentaire,
                        objetARecevoir: widget.objetARecevoir,
                        valeurNet: widget.valeurNet, 
                        myTrim: 1,
                      )
                    ),
                    
                     Flexible(
                      fit: FlexFit.tight,
                       child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                          Routes.detailtrop,
                        arguments: {
                          'image' :widget.imageTroc,
                          'commentaire':widget.commentaire,
                          'valeur': widget.valeurNet,
                          'attendu':widget.objetARecevoir 
                        }, 
                      );
                        },
                         child: SizedBox(
                            height: 450,
                            width: double.infinity,
                            child:widget.imageTroc is String 
                            ?
                            Image.asset( widget.imageTroc,fit: BoxFit.cover)
                            :
                            Image.file( File(widget.imageTroc.path) , fit: BoxFit.cover),
        
                          ),
                       ),
                     ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: UserIdea(
                        myTextColor: Colors.black,
                        iconColor: Colors.black,
                      ),
                    )
                  ],
              )
    );
  }
}