import 'package:finology/Constance/constance.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/screen/HomePage/Pret/pret_crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Constance/helpers.dart';
import '../../../../main.dart';
import '../../../../services/pret_service.dart';
import '../../../../services/services_factory.dart';

class PretItem extends StatelessWidget {
   String ? description;
   double ?  montantDuPret;
   String ? dateDeLaDemande;
   DateTime ? dateDeRembourssement;
   String ? raison;
   int ? tauxDinteret;
   bool ? status;
   String? userName;
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
      Future<bool> _deleteItem({required String id}) async{
      PretService pretService = ServiceFactory.createPretService();
      bool isDeleted = await pretService.deleteById(id);

      if(isDeleted)
      {
        await fetchPrets(context);
        return true;
      }
      else{
        return false;
      }
    }

   var MediaQueryWidth = MediaQuery.of(context).size.width;
    final _user = Provider.of<User?>(context);
    //userName = _user!.displayName!;
    return GestureDetector(
      onTap: () {
         Navigator.pushNamed(context, 
          Routes.detailpret, arguments: {'pretid':idPret, 'userName': userName}
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                      itemBuilder: (context) =>[
                         PopupMenuItem(
                          value: "modifier",
                          onTap: () {
                            push(
                               context, PretCreation(isEdit: true,user: userName,pretId: idPret,)
                            );
                          },
                          child: Text("modifier"),
                        ),
                        PopupMenuItem  (
                          value: "Supprimer",
                          onTap: () {
                            _deleteItem(id: idPret!);
/*                             Provider.of<PretProvider>(context, listen: false)
                              .deletePret(idPret); */
                          },
                          child:  Text("supprimer"),
                        ),
                      ],
                      onSelected: (String newValue) {}
                   )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(description!, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),),
            Text(userName!, style:TextStyle( fontSize: 13, fontWeight: FontWeight.bold))
          ],
        )
      ),
    );
  }
}