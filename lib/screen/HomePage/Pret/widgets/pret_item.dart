import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';

class PretItem extends StatelessWidget {
   String ? description;
   double ?  montantDuPret;
   String ? dateDeLaDemande;
   DateTime ? dateDeRembourssement;
   String ? raison;
   int ? tauxDinteret;
   bool ? status;
   String userName;
   bool ? isAddWidget;
   String ? idPret;
  
   PretItem({
    super.key,
     this.dateDeLaDemande,
     this.dateDeRembourssement,
     this.description,
     this.tauxDinteret,
     this.raison,
     this.montantDuPret,
    required this.userName,
     this.isAddWidget,
     this.status,
     this.idPret
    }) ;


  @override
  Widget build(BuildContext context) {

   var MediaQueryWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, 
          Routes.detailpret, arguments: {'pretid':idPret}
                                );
      },
      child: Container(
        width: MediaQueryWidth / 3,
        padding:  EdgeInsets.all(defaultPadding),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(description!, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),),
            Text(userName, style:TextStyle( fontSize: 13, fontWeight: FontWeight.bold))
          ],
        )
      ),
    );
  }
}