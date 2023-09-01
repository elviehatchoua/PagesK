import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TrocItem extends StatefulWidget {
  final String userName;
  final double valeurNet;
  final String objetARecevoir;
  final String commentaire;
   var imageTroc;


    TrocItem({required this.commentaire,required this.objetARecevoir,required this.valeurNet ,required this.imageTroc, required this.userName ,super.key});

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
              height: 450,
              color: Colors.white,
              child:  Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left : 16.0, bottom: 8, right: 8),
                      child: Row(
                        children: [
                          const CircleAvatar(radius : 23),
                          const SizedBox(width: 5,),
                           Text(widget.userName),
                          const Spacer(),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 16.0, bottom: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                         child: ReadMoreText( 
                             "${widget.commentaire},\n Valeur Net : ${widget.valeurNet}Fcfa,\n Objet attendu: ${widget.objetARecevoir}", 
                             style:TextTheme.bodyText1!.copyWith(fontSize: 16),
                             lessStyle : const TextStyle(color : Color.fromARGB(255, 90, 90, 92), fontWeight: FontWeight.bold),
                             trimMode: TrimMode.Line,
                             trimLines:1,
                             trimCollapsedText: '...Voir plus',
                            trimExpandedText: '  .Voir moins',
                             ),
                       ),
                    ),
                    /*  Align(
                      alignment: Alignment.topLeft,
                       child: Column(
                         children: [
                           Text(widget.commentaire, 
                              style:TextTheme.bodyText1!.copyWith(fontSize: 16) ,
                              maxLines: myMaxLIne,
                            ),
                            TextButton(
                              onPressed: () => setState(() => isVoirPlus = !isVoirPlus ), 
                              child: Text(isVoirPlus ? "Voir Plus" : "Voir Moin")
                            )
                         ],
                       ),
                     ), */
                     Flexible(
                      fit: FlexFit.tight,
                       child: SizedBox(
                        height: 250,
                        width: double.infinity,
                        child:widget.imageTroc is String 
                        ?
                        Image.asset( widget.imageTroc,fit: BoxFit.cover)
                        :
                        Image.file( File(widget.imageTroc.path) , fit: BoxFit.cover),
                        /* Image.asset( imageTroc
                          ,fit: BoxFit.cover
                        ), *///Image.asset(ConstanceData.adiddas,
                                         ),
                     ),
                     const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left : 16.0, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                    
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 80,
                              height: 40,
                              child : const Row(
                                children: [
                                  Icon(Icons.thumb_up),
                                  VerticalDivider(
                                    thickness: 4,
                                    indent: 30,
                                    endIndent: 30,  
                                  ),
                                  Icon(Icons.thumb_down),
                                ]
                              )
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 125,
                              height: 40,
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.comment, size: 20,),
                                  const SizedBox(width: 5,),
                                   Text ("Commenter", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                                ]
                              )
                            ),
                          
                           Container(
                              padding: const EdgeInsets.all(8),
                              width: 115,
                              height: 40,
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.share, size: 20,),
                                  const SizedBox(width: 5,),
                                  Text("Partager", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))
                                ]
                              )
                            ),
                        ],
                      ),
                    )
                  ],
              )
    );
  }
}