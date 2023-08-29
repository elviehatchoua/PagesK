import 'package:flutter/material.dart';

import '../Constance/constance.dart';


class Troc {
  String ? detailTroc;
  String ? imageTroc;
  String ? userName;

  Troc(
    {this.detailTroc, this.imageTroc, this.userName}
  );
}

List TrocList = [
  Troc(
    detailTroc: 'Bonjour ici, j\'ai une chaussure addidas à vendre, bon prix.',
    imageTroc: ConstanceData.adiddas,
    userName: "Andrea"
  ),
   Troc(
    detailTroc: 'Je veux une machine en echange',
    imageTroc: ConstanceData.bankLogo,
    userName: "Elvie"
  ),
   Troc(
    detailTroc: 'Soir soir qui veut mon téléphone?',
    imageTroc: ConstanceData.phone,
    userName: "Michelle"
  ),
];