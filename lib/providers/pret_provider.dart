
import 'package:finology/core/Models/pret_model.dart';
import 'package:flutter/material.dart';

class PretProvider with ChangeNotifier{

  List<PretModel> _MyPretList = [];
 
//read
  List<PretModel> get getPretList 
  {
    return [... _MyPretList];
  }

  //set
  void setPrets(List<PretModel> itemPrets)
  {
    _MyPretList = itemPrets;
    print("my new list : ${_MyPretList}");
    notifyListeners();
  }

  //create
  void addNewPret(PretModel txPret)
  {
    _MyPretList.insert(0,txPret);

    notifyListeners();
  }

  //edit
  void editPret(PretModel pret)
  {
    var index = _MyPretList.indexWhere((element) => element.id == pret.id!);
    _MyPretList[index] = pret;
    notifyListeners();
  }

  //delete
    void deletePret(String ? id){
      _MyPretList.removeWhere((troc) => troc.id ==id);
      for(int i=1; i<= _MyPretList.length; i++ ){
        _MyPretList.map((pret) {
          pret.id == i;
        }
      );
      }
      notifyListeners();
    }

  PretModel getPretById(String idPret)
  {
    return _MyPretList.firstWhere((element) => element.id == idPret);
  }
}

     /* PretModel(
      id: "1",
      description: 'j\'ai besoin de cette argent',
      montantDuPret: 1000, 
      createdAt: DateTime.now(),//DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      dateDeRembourssement:  DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux faire un transfert à ma soeur", 
      tauxDinteret: 10, 
      userName: 'Elvie',
      status: true,
    ),
    PretModel(
      id: "2",
      description: 'qui peut m\'aider',
      montantDuPret: 2000, 
      createdAt: DateTime.now(), 
      dateDeRembourssement: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux acheter à manger", 
      tauxDinteret: 10,
      userName: 'Norton',
      status: false,

    ),
    PretModel(
      id: "3",
      description: 'j\'ai besoin de cette argent',
      montantDuPret: 1000000000, 
      createdAt:DateTime.now(),  
      dateDeRembourssement: DateFormat("dd/MM/yyyy").parse("23/09/2023"),  
      raison: "je veux une voiture", 
      tauxDinteret: 10,
      userName: 'Ristow',
      status: true,

    )  */