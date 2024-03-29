import 'package:finology/core/Models/troc_model.dart';
import 'package:flutter/material.dart';

import '../Constance/constance.dart';


class TrocProvider with ChangeNotifier{

  final List<TrocModel> _trocList = [
    TrocModel(
      id: "1",
    descriptionTroc: 'Bonjour ici, j\'ai une chaussure addidas à vendre, bon prix.',
    imagePath: ConstanceData.adiddas,
    userName: "Andrea", 
    valeurNet: 4.500, 
    isUrgent: false,
    objetARecevoir: 'un bijoux',
    categorie: "Chaussure"

  ),
   TrocModel(
      id: "2",
    descriptionTroc: 'Je veux une machine en echange',
    imagePath: ConstanceData.bankLogo,
    userName: "Elvie",
    valeurNet: 5500000, 
    isUrgent: true,
    objetARecevoir: 'une machine core I3',
    categorie: "laptop"

  ),
   TrocModel(
      id: "3",
    descriptionTroc: 'Soir soir qui veut mon téléphone?',
    imagePath: ConstanceData.phone,
    userName: "Michelle",
    valeurNet: 10.500, 
    isUrgent: false, 
    objetARecevoir: 'un sac',
    categorie: "appareil"

  ),
  ];

  //read
  List<TrocModel> get trocList{
    return [... _trocList];
  }
//create
  void addNewTroc(TrocModel txTroc){
    txTroc.id == "${_trocList.length +1}";

    _trocList.insert(0,txTroc);
    notifyListeners();
  }
//edit
  void editTroc(TrocModel txTroc){
    var index = trocList.indexWhere((element) => element.id == txTroc.id!);
    _trocList[index] = txTroc;
    notifyListeners();
  }
//delete
    void deleteTroc(String ? id){
      _trocList.removeWhere((troc) => troc.id ==id);
      for(int i=1; i<= _trocList.length; i++ ){
        _trocList.map((troc) {
          troc.id == i;
        }
      );
      }
      notifyListeners();
    }

}