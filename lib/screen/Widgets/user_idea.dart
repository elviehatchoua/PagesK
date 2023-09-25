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
    bool isLike = true;
    void _isklicked(){
      setState(() {
        isLike =! isLike;
      });
    }

     void _showMyCommentBottomSheet (context) {
    showModalBottomSheet(
      elevation:10,
      backgroundColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
           top: Radius.circular(50)
         )
       ),
       context: context, 
       builder: (context) => FractionallySizedBox(
        heightFactor: 2.4,
        child:UserComment() ,)
       );
       /* {
         return  UserComment();
        }
    );*/
}
  @override
  Widget build(BuildContext context) {
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
                                    onPressed : () => _isklicked(),
                                    icon: Icon( isLike==false ?  Icons.thumb_up
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
                                onTap: () {_showMyCommentBottomSheet(context);},
                               /*  showBottomSheet(
                                  context: context, 
                                  builder: ((builder)=>const FractionallySizedBox(
                                    heightFactor : 0.8,
                                    child:  SingleChildScrollView(child: UserComment())
                                  ))
                                ); */
                              
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