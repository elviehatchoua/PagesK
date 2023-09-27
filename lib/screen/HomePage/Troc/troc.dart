import 'package:finology/providers/troc_provider.dart';
import 'package:finology/screen/HomePage/Troc/troc_crud.dart';
import 'package:finology/screen/HomePage/Troc/widgets/troc_item.dart';
import 'package:provider/provider.dart';
import '../../../Constance/helpers.dart';

import 'package:finology/screen/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/Constance/constance.dart';

class Troc extends StatefulWidget {
  const Troc({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Troc> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    final trocList = Provider.of<TrocProvider>(context, listen:true).trocList;
  //var ThemeColor = Theme.of(context);
  var TextTheme = Theme.of(context).textTheme;
   var MediaQueryWidth = MediaQuery.of(context).size.width;
   var MediaQueryHeight = MediaQuery.of(context).size.height;
    return NestedScrollView(
       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text('Publications',
              style: TextTheme.headlineSmall!.copyWith(fontSize: 20)),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leadingWidth: MediaQuery.of(context).size.width / 2,
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(defaultPadding - 5,
                    defaultPadding, defaultPadding, defaultPadding),
                child: AppBarIcons()
              )
            ],
            floating: true,
            snap: true,
          ),
        ];
       },
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
            child: Column(
              children: <Widget>
              [
                Padding (
                padding: EdgeInsets.only(
                    top: MediaQueryHeight / 70,
                    //right: MediaQueryWidth / 30,
                    //left: MediaQueryWidth / 30,
                    bottom: MediaQueryHeight / 40),
                child: Column(
                    children: <Widget>[
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        padding: EdgeInsets.only(top: MediaQueryHeight / 70,left: MediaQueryWidth / 30),
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              children: [                
                               SizedBox(height:defaultPadding ,), 
                                const CircleAvatar(radius: 23),
                                const SizedBox(width: defaultPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 245,
                                      height: 50,
                                      child : ElevatedButton(
                                        style : ElevatedButton.styleFrom(
                                          side: const BorderSide(
                                            width: 1.0,
                                            color: Colors.blue,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),   
                                          ),
                                          backgroundColor: Colors.white,
                                          elevation: 0
                                        ), 
                                        onPressed: () {
                                          push ( context, 
                                            TrocCreation(trocId: null, isEdit: false,)
                                          );
                                          
                                           /* Navigator.push( context,
                                           MaterialPageRoute(builder: (context) => TrocCreation(addTroc) )
                                          );  */
          
                                         //Navigator.of(context).push(_createRoute());
          
                                        }, 
                                        child: Text("Un nouveau troc, vous tente?", 
                                          style: TextTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.bold, 
                                            fontSize: 14
                                          )
                                        ),
                                      )
                                    ),           
                            ],
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.style)
                        ],
                      ),  
                          ],
                        ),
                      )
                    ],
                  ),
              ),
              Container (
                height: 190,
                color: Theme.of(context).scaffoldBackgroundColor,
                margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
                child: ListView.builder(
                  padding: EdgeInsets.only(left: MediaQueryWidth / 30),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => Row(
                    children: [
                      Container(
                        width: MediaQueryWidth / 3,
                        padding: const EdgeInsets.all(defaultPadding),
                        margin: const EdgeInsets.only(
                          right: defaultPadding, top: 5, left: 3, bottom: 5),
                        decoration: BoxDecoration(
                          color:Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                          boxShadow: [
                            BoxShadow(
                              color:Theme.of(context).disabledColor,
                              blurRadius: 5,
                              spreadRadius: 2
                            ),
                      ],
                    ),
                    child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.add),
                              Text("faire un"),
                              Text("pret")
                            ],
                          )
                  ),
                ],
              ),
            ),
          ), 
      
              Column(
                children: trocList.map((e) {
                  return TrocItem(
                    isPersonal: false,
                    idTroc: e.id,
                    commentaire:e.descriptionTroc,  
                    imageTroc: e.imagePath, 
                    userName: e.userName, 
                    valeurNet: e.valeurNet, 
                    objetARecevoir:e.objetARecevoir,
                  );
                }).toList()
              ),
          
            ],
          
            ),
          ),
      ),
        /* padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding), */
      

          //Troc part




           //ListView Builder
    /*        Container(
            height: 500,
             child: ListView.builder(
              //reverse: true,
              itemCount: trocList.length,
              itemBuilder: (context, index){
                return TrocItem(
                  isPersonal: false,
                  idTroc: trocList[index].id,
                  commentaire: trocList[index].descriptionTroc,  
                  imageTroc: trocList[index].imagePath, 
                  userName: trocList[index].userName, 
                  valeurNet: trocList[index].valeurNet, 
                  objetARecevoir: trocList[index].objetARecevoir,
                );
             }),
           ) */
      
    
  );
  }
}

/* Route _createRoute() {
  Function ? addTroc;
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  TrocCreation(addTroc),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
} */












