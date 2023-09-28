import 'package:finology/core/Models/base.dart';

class Pret extends BaseModel{
  String ? description;
  double montantDuPret;
  DateTime dateDeLaDemande;
  DateTime dateDeRembourssement;
  String raison;
  int tauxDinteret;
  bool? status;

  Pret({
    super.id,
    this.description,
    required this.montantDuPret,
    required this.dateDeLaDemande,
    required this.dateDeRembourssement,
    required this.raison,
    required this.tauxDinteret,
    this.status
  });

   factory TrocModel.fromJson(Map<String, dynamic> json) =>
      _$TrocModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrocModelToJson(this);

//annotation
  @override
String toString() {
  return jsonEncode(toJson());
}
}