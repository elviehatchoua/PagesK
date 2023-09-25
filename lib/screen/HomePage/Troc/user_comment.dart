import 'package:flutter/material.dart';

class UserComment extends StatefulWidget{

    const UserComment({super.key});

  @override
  State<UserComment> createState() => UserCommentState();
}

class UserCommentState extends State<UserComment> {

  List<String> MyLIst = List<String>.generate(20, (index) => "item N:$index");
  
    @override
  Widget build (BuildContext context) { 
  var TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vous commentez le troc de ..."),
      ),
      body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:Container(
                  height:300,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                   // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                         FittedBox(child: Icon(Icons.comment, color: Color.fromARGB(255, 209, 214, 218),size: 200,)),
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
           
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                 // color: Colors.deepOrange,
                 // height: 20,
                  padding: EdgeInsets.only( right: 8, left: 8, bottom: MediaQuery.of(context).viewInsets.bottom +50),
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
              ),
            ],
      
          ),
      
 
    );

  }
}
                /*  Expanded(
                   child: Container(
                       height: 620,
                       //color: Colors.amber,
                     
                      child:Column(
                        children: [
                          Container(
                            height: 400,
                            child: ListView.builder(
                                              itemCount: MyLIst.length,
                                              itemBuilder: (BuildContext context, index) {
                                                return ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: Colors.blue,
                                                  ),
                                                  title:Text( MyLIst[index],)
                                                );
                                              
                                                
                                              }),
                          ),
                          

                            Container(
                                      padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
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
                          
                        ],
                      )
                  ),
                 ) */
                      /* MyLIst.isEmpty
                        ? 
                        Column(
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Icon(Icons.comment, color: Color.fromARGB(255, 209, 214, 218),size: 200,),
                                          
                                              Center(
                                                child: const Text("Aucun commentaire pour l'instant"),
                                              ),
                                              Center(
                                                child:  Text("Soyez le premier à commenter", style: TextTheme.bodySmall,),
                                              )
                                            ],
                                          ),
                                        ]
                        )
                        : */
                         /* Flexible(
                          
                          fit:FlexFit.tight,
                           child: ListView.builder(
                                            itemCount: MyLIst.length,
                                            itemBuilder: (BuildContext context, index) {
                                              return ListTile(
                                                leading: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor: Colors.blue,
                                                ),
                                                title:Text( MyLIst[index],)
                                              );
                                            
                                              
                                            }),
                         ), */
                      
                     
                             /* child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                               child: Column( */
                              
                              
                              
                              /*  ),
                                 
                               Flexible(
                                 fit: FlexFit.tight,
                                 
                                 child: Container(
                                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 10),
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
                               ),   */
                               
                          
                          
                          
                             
                         
                            /* 
                 
                 
                 
                 
                              SingleChildScrollView(
                                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     /*  Container(
                        color: Colors.black,
                        child: const Text("Hello"),
                      ), */
                    Container(
                      color: Colors.amber,
                      height: 600,
                      child: Flexible(
                      fit: FlexFit.loose,
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
                                 /* Container(
                        color: Colors.blueAccent,
                        child: const Text("Hi"),) */
                                 Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      child: Expanded(
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
                                 ),
                                 ),
                    ],
                                 ),
                               )
                  */            
                  


/**
 * 
 * Column( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [ 
               Container(
               color: Colors.amber,
                height: 350,
                child: Flexible(
                  fit: FlexFit.loose,
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
             // Divider(),
            Container(
                color: Colors.blue,
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
 */
      
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