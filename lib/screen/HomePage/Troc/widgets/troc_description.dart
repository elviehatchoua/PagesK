import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TrocDescription extends StatelessWidget {
   final String ? commentaire;
   final double ? valeurNet;
   final String ? objetARecevoir;
   final Color ? myTextColor;
   final int  myTrim;
  
   TrocDescription({Key? key,required this.myTrim,this.myTextColor ,this.commentaire, this.objetARecevoir, this.valeurNet}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  var TextTheme = Theme.of(context).textTheme;

    return Align(
              alignment: Alignment.topLeft,
              child :ReadMoreText( 
                "${commentaire},\n Valeur Net : ${valeurNet}Fcfa,\n Objet attendu: ${objetARecevoir}", 
                style:TextTheme.bodyLarge!.copyWith(fontSize: 16, color: myTextColor),
                lessStyle : const TextStyle(color : Color.fromARGB(255, 90, 90, 92), fontWeight: FontWeight.bold),
                trimMode: TrimMode.Line,
                trimLines:myTrim,
                trimCollapsedText: '...Voir plus',
                trimExpandedText: '  .Voir moins',
              )
           );
  }
}