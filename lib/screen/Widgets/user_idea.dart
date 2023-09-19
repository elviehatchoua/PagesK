import 'package:flutter/material.dart';

import '../HomePage/Troc/user_comment.dart';

class UserIdea extends StatefulWidget {
  final Color? iconColor;
  final Color? myTextColor;
  const UserIdea({Key? key, this.iconColor, this.myTextColor}) : super(key: key);

  @override
  State<UserIdea> createState() => _UserIdeaState();
}

class _UserIdeaState extends State<UserIdea> {
  //const UserIdea({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLike = false;
     var TextTheme = Theme.of(context).textTheme;
    return  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                    
                            Container(
                              padding: const EdgeInsets.only(left:2),
                              width: 80,
                              height: 40,
                              child :  Row(
                                children: [
                                  IconButton(
                                    onPressed : (){
                                      setState(){
                                        isLike = ! isLike;
                                      }
                                    },
                                    icon: Icon( isLike == true ?  Icons.thumb_up
                                    : Icons.thumb_up_alt_outlined, color: widget.iconColor),
                                  ),
                                  //Icon(Icons.thumb_up, color: iconColor),
                                  VerticalDivider(
                                    thickness: 4,
                                    indent: 30,
                                    endIndent: 30,  
                                  ),
                                 // Icon(Icons.thumb_down,color: widget.iconColor),
                                ]
                              )
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              width: 125,
                              height: 40,
                              child : GestureDetector(
                                onTap: () {
                                showBottomSheet(
                                  context: context, 
                                  builder: ((builder)=>const FractionallySizedBox(
                                    heightFactor : 0.8,
                                    child:  SingleChildScrollView(child: UserComment())
                                  ))
                                );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Icon(Icons.comment, size: 20,color: widget.iconColor),
                                    const SizedBox(width: 5,),
                                     Text ("Commenter", 
                                      style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, color: widget.myTextColor),
                                     )
                                  ]
                                ),
                              )
                            ),
                          
                           Container(
                              padding: const EdgeInsets.only(left: 25),
                              width: 115,
                              height: 40,
                              child : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Icon(Icons.share, size: 20,color: widget.iconColor),
                                  const SizedBox(width: 5,),
                                  Text("Partager", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, color: widget.myTextColor))
                                ]
                              )
                            ),
                        ],
                      ),
                    );
  }
}