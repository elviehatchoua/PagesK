
import 'package:finology/core/Models/pret_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PretProvider with ChangeNotifier{

  List<PretModel> _MyPretList = [
    PretModel(
      id: "1",
      description: 'j\'ai besoin de cette argent',
      montantDuPret: 1000, 
      dateDeLaDemande: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      dateDeRembourssement:  DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux faire un transfert à ma soeur", 
      tauxDinteret: 10, 
      userName: 'Elvie'
    ),
    PretModel(
      id: "2",
      description: 'qui peut m\'aider',
      montantDuPret: 2000, 
      dateDeLaDemande:  DateFormat("dd/MM/yyyy").parse("23/09/2023"),   
      dateDeRembourssement: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux acheter à manger", 
      tauxDinteret: 10,
      userName: 'Norton'
    ),
    PretModel(
      id: "3",
      description: 'j\'ai besoin de cette argent',
      montantDuPret: 1000000000, 
      dateDeLaDemande: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      dateDeRembourssement: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux une voiture", 
      tauxDinteret: 10,
      userName: 'Ristow'

    )
  ];

  List<PretModel> get MyPretList 
  {
    return [... _MyPretList];
  }
}