import 'package:flutter/material.dart';

class UserComment extends StatefulWidget{

    const UserComment({super.key});

  @override
  State<UserComment> createState() => UserCommentState();
}

class UserCommentState extends State<UserComment> {
  
    @override
  Widget build (BuildContext context) { 
  var TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vous commentez le troc de ..."),
      ),
      body: 
            SingleChildScrollView(
              child: Column( 
                children: <Widget> [ 
               Container(
                color: Colors.green,
                height: 350,
                child: Flexible(
                  fit: FlexFit.tight,
                child: 
                    Column(
                            
                            children: [
                               Icon(Icons.comment, color: Color.fromARGB(255, 209, 214, 218),size: 200,),
                              
                              Center(
                                child: const Text("Aucun commentaire pour l'instant"),
                              ),
                              Center(
                                child:  Text("Soyez le premier à commenter", style: TextTheme.bodySmall,),
                              )
                            ],
                          ),
              ),
              ),
            Container(
                
                  //margin: const EdgeInsets.only(top: 200),
                  //padding: const EdgeInsets.only( bottom: 10, right: 8, left: 8),
                  child: TextField(
                  decoration: InputDecoration( 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), 
                    ),
                    hintText: "Commentez le troc de ...",
                    fillColor: Colors.grey[100],
                    focusColor: Colors.grey[100],
                               
                  ),
                  ),
               ),
              ]
              )
            )
     
      
      /* SingleChildScrollView(
             child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
               child: Column(
                children: [
                  Container(
                    //color: Colors.blue,
                      height: 300,
                    child: Expanded(
                      child: Column(
                        children: [
                           Icon(Icons.comment, color: Color.fromARGB(255, 209, 214, 218),size: 200,),
                          
                          Center(
                            child: const Text("Aucun commentaire pour l'instant"),
                          ),
                          Center(
                            child:  Text("Soyez le premier à commenter", style: TextTheme.bodySmall,),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only( top:150 ),
                   
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Set the border radius
                        color: Color.fromARGB(255, 165, 165, 168),
                 // Set the color of the Divider
                      ),
                      child: Divider(
                        height: 1, // height of the Divider
                        thickness: 1, // thickness of the Divider
                      ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                 
                  Container(
                    padding: const EdgeInsets.only( top:10 , right: 8, left: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                      hintText: "Commentez le troc de ...",
                      fillColor: Colors.grey[100],
                      focusColor: Colors.grey[100],
                           
                      ),
                    ),
                  )
                  
                ],
                       ),
             ),
           ), */
      
      );
  }
}