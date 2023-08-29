import 'package:flutter/material.dart';

import '../../Constance/constance.dart';

class TrocItem extends StatelessWidget {
  String userName;
  String detailTroc;
  String imageTroc;


   TrocItem({required this.detailTroc, required this.imageTroc, required this.userName ,super.key});

  @override
  Widget build(BuildContext context) {
     var TextTheme = Theme.of(context).textTheme;
   //var MediaQueryWidth = MediaQuery.of(context).size.width;
   var MediaQueryHeight = MediaQuery.of(context).size.height;
    return  Container(
              margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
              width: double.infinity,
              height: 450,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius : 23),
                        const SizedBox(width: 5,),
                         Text(userName),
                        const Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                     Text(detailTroc, 
                        style:TextTheme.bodyText1!.copyWith(fontSize: 16) ,),
                     SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset( imageTroc
                        ,fit: BoxFit.cover
                      ),//Image.asset(ConstanceData.adiddas,
                    ),
                     const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 179, 208, 231),
                          ),
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 179, 208, 231),
                          ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.comment, size: 20,),
                              const SizedBox(width: 5,),
                               Text("Commenter", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                            ]
                          )
                        ),
                         Container(
                          padding: const EdgeInsets.all(8),
                          width: 115,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 179, 208, 231),
                          ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.share, size: 20,),
                              const SizedBox(width: 5,),
                              Text("Partager", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))
                            ]
                          )
                        ),
                        
                       /*  Container(
                          width: 119,
                          child: CustomButton(
                            onPressed: () {  },
                            icon: Icons.comment,
                            SizeIcon: 10,
                            text: "Commenter",style: TextTheme.overline,
                            height: 35,
                          ),
                        ),
                        Container(
                          width: 119,
                          child: CustomButton(
                            onPressed: () {  },
                            icon: Icons.share,
                            SizeIcon: 10,
                            text: "Partager",style: TextTheme.overline,
                            height: 35,
                          ),
                        ) */
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}