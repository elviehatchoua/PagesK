// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, camel_case_types, prefer_adjacent_string_concatenation, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, deprecated_member_use

import 'package:finology/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:finology/Constance/constance.dart';

import '../../Models/myfiles.dart';

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
      body: Container(
        color: Color.fromARGB(255, 221, 225, 228),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQueryHeight / 70,
              right: MediaQueryWidth / 30,
              left: MediaQueryWidth / 30,
              bottom: MediaQueryHeight / 40),
          child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: MediaQueryHeight / 70,left: MediaQueryWidth / 30),
                  height: 100,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Publications',
                          style: TextTheme.headline5!.copyWith(fontSize: 20)),
                      ), 
                      SizedBox(height:defaultPadding ,), 
                      Row(
                        children: [                
                          const CircleAvatar(radius: 23),
                          const SizedBox(width: defaultPadding),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Un nouveau troc?", style: TextTheme.bodyText2),
                      ],
                    ),
                    SizedBox(width: 90,),
                    Icon(Icons.style)
                  ],
                ),  
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
