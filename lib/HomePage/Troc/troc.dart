import 'package:finology/HomePage/Troc/troc_creation.dart';
import 'package:finology/HomePage/Troc/troc_item.dart';
import '/Models/troc_model.dart';
//import 'package:finology/Widgets/widgets.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/Constance/constance.dart';

//import 'package:finology/Widgets/widgets.dart';

class Troc extends StatefulWidget {
  const Troc({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Troc> with SingleTickerProviderStateMixin {


  final List<TrocModel> TrocList = [
  TrocModel(
    commentaire: 'Bonjour ici, j\'ai une chaussure addidas à vendre, bon prix.',
    imagePath: ConstanceData.adiddas,
    userName: "Andrea", 
    valeurNet: 4.500, 
    isSwitched: false,
    objetARecevoir: 'un bijoux'

  ),
   TrocModel(
    commentaire: 'Je veux une machine en echange',
    imagePath: ConstanceData.bankLogo,
    userName: "Elvie",
    valeurNet: 5500000, 
    isSwitched: true,
    objetARecevoir: 'une machine core I3'
  ),
   TrocModel(
    commentaire: 'Soir soir qui veut mon téléphone?',
    imagePath: ConstanceData.phone,
    userName: "Michelle",
    valeurNet: 10.500, 
    isSwitched: false, 
    objetARecevoir: 'un sac'
  ),
]; 
 
  void addTroc(double TxenterredvaleurNet,String TxenterredObjetARecevoir,String TxenterredCommentaire,var TximagePath,bool TxisSwitched)
  {
    final newTx = TrocModel(
        commentaire: TxenterredCommentaire,
        imagePath: TximagePath,
        objetARecevoir: TxenterredObjetARecevoir,
        userName: "1", 
        valeurNet: TxenterredvaleurNet, 
        isSwitched: TxisSwitched
    );
    setState(() {
      TrocList.add(newTx);
    });
  }
  @override
  Widget build(BuildContext context) {
  //var ThemeColor = Theme.of(context);
  var TextTheme = Theme.of(context).textTheme;
   var MediaQueryWidth = MediaQuery.of(context).size.width;
   var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Publications',
          style: TextTheme.headline5!.copyWith(fontSize: 20)),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(defaultPadding - 5,
                  defaultPadding, defaultPadding, defaultPadding),
              child: AppBarIcons())
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
        children: [ Padding (
            padding: EdgeInsets.only(
                top: MediaQueryHeight / 70,
                //right: MediaQueryWidth / 30,
                //left: MediaQueryWidth / 30,
                bottom: MediaQueryHeight / 40),
            child: Column(
                children: [
                  Container(
                    color: Colors.white,
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
                                      Navigator.push( context,
                                       MaterialPageRoute(builder: (context) => TrocCreation(addTroc) )
                                      );
                                    }, 
                                    child: Text("Un nouveau troc, vous tente?", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
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
           //ListView Builder
           Container(
            height: 500,
             child: ListView.builder(
              reverse: true,
              itemCount: TrocList.length,
              itemBuilder: (context, index){
                return TrocItem(
                  commentaire: TrocList[index].commentaire,  
                  imageTroc: TrocList[index].imagePath, 
                  userName: TrocList[index].userName, 
                  valeurNet: TrocList[index].valeurNet, 
                  objetARecevoir: TrocList[index].objetARecevoir,
                );
             }),
           )
      ]
    ),
  );
  }
}















// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, camel_case_types, prefer_adjacent_string_concatenation, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, deprecated_member_use
/* 
import 'package:finology/HomePage/Troc/troc_creation.dart';
import 'package:finology/HomePage/Troc/troc_item.dart';
import 'package:finology/Models/troc_model.dart';
import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:finology/Constance/constance.dart';

class Troc extends StatefulWidget {
  const Troc({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Troc> with SingleTickerProviderStateMixin {
 

  @override
  Widget build(BuildContext context) {
  //var ThemeColor = Theme.of(context);
  var TextTheme = Theme.of(context).textTheme;
   var MediaQueryWidth = MediaQuery.of(context).size.width;
   var MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Publications',
          style: TextTheme.headline5!.copyWith(fontSize: 20)),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(defaultPadding - 5,
                  defaultPadding, defaultPadding, defaultPadding),
              child: AppBarIcons())
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
        children: [ Padding (
            padding: EdgeInsets.only(
                top: MediaQueryHeight / 70,
                //right: MediaQueryWidth / 30,
                //left: MediaQueryWidth / 30,
                bottom: MediaQueryHeight / 40),
            child: Column(
                children: [
                  Container(
                    color: Colors.white,
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
                                      foregroundColor: Colors.blue,
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
                                      Navigator.push( context,
                                       MaterialPageRoute(builder: (context) => TrocCreation() )
                                      );
                                    }, 
                                    child: Text("Un nouveau troc, vous tente?", style: TextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
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
           //ListView Builder
           Container(
            height: 500,
             child: ListView.builder(
              itemCount: TrocList.length,
              itemBuilder: (context, index){
                return TrocItem(
                  detailTroc: TrocList[index].detailTroc, 
                  imageTroc: TrocList[index].imageTroc, 
                  userName: TrocList[index].userName
                );
             }),
           )
      ]
    ),
  );
  }
}
 */

/*  Container(
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
                        const Text('Andrea'),
                        const Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                     Text('Bonjour ici, j\'ai une chaussure addidas à vendre, bon prix.', 
                        style:TextTheme.bodyText1!.copyWith(fontSize: 16) ,),
                     SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(ConstanceData.adiddas,
                        fit: BoxFit.cover
                      ),
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
                          child : Row(
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
                            color: Color.fromARGB(255, 179, 208, 231),
                          ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.comment, size: 20,),
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
                            color: Color.fromARGB(255, 179, 208, 231),
                          ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share, size: 20,),
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
            ),
            TrocItem(
              detailTroc: "Je veux une machine en echange", 
              imageTroc: ConstanceData.appleIcon, 
              userName: "Elvie"
            ) */
