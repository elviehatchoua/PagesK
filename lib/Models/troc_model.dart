import 'dart:core';

class TrocModel {
 
  String  userName;
  String  objetARecevoir;
  String  commentaire;
  double valeurNet;
    var   imagePath;
    bool  isSwitched;

  TrocModel({
    required this.objetARecevoir,
    required this.valeurNet,
    this.imagePath,
    required this.isSwitched,
    required this.commentaire, 
    required this.userName
  }
  );
}

 