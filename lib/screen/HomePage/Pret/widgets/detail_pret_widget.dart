import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../../Widgets/user_idea.dart';

class DetailPretItem extends StatelessWidget {
   String ? description ;
   double ?  montantDuPret ;
   String ? dateDeLaDemande ;
   DateTime ? dateDeRembourssement ;
   String ? raison ;
   int ? tauxDinteret ;
   String userName ;
   String ? idPret;
  
   DetailPretItem({
    super.key,
     this.dateDeLaDemande,
     this.dateDeRembourssement,
     this.description,
     this.tauxDinteret,
     this.raison,
     this.montantDuPret,
    required this.userName,
     this.idPret
    }) ;


  @override
  Widget build(BuildContext context) {

   var MediaQueryWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius:15,
                ),
                const SizedBox(width: 20),
                Text(userName),
                Spacer(),
                FittedBox(child: Text("publié à ${dateDeLaDemande}h"),)
              ],
            ),
            const SizedBox(height: 80,),
            Container(
              height: 499,
              padding: EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                child: Card(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("${description}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Montant du pret:${montantDuPret}Fcfa"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Je rembourse le:${dateDeRembourssement}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("raison:${raison}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Taux d'interet:${tauxDinteret}%"),
                        ),
                                
                      ],
                    ),
                  ),
                ),
              ),
            ),
           // const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: UserIdea(
                myTextColor: Colors.black,
                iconColor: Colors.black,
              ),
            )
          ],
        ),
      );
    
  }
}