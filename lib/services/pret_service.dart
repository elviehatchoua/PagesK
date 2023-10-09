
import '/core/Models/pret_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class PretService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  PretService();

  Future<PretModel> create(PretModel item) async{
    DocumentReference requestRef = _db.collection("prets").doc();
    await requestRef.set(item.toJson());
    item.id = requestRef.id;
    return item;
  }

  Future<PretModel> update(String pretId, PretModel item) async{
    _db
        .collection("prets")
        .doc(pretId)
        .update({...item.toJson()}).then((res){
          debugPrint("Update");
    });
    return item;  
  }

  Future <List<PretModel>> getAll() async {
    QuerySnapshot<Map<String, dynamic>> requestsQuery =
      await _db.collection("prets").get();

    List<PretModel> prets = requestsQuery.docs.map((d){
      PretModel pret = PretModel.fromJson(d.data());
      pret.id = d.id;
      return pret;
    }).toList();

    return prets;
  }

  Future<PretModel> getById(String id) async{
    DocumentSnapshot<Map<String, dynamic>> requestsQuery =
      await _db.collection("prets").doc(id).get();

    PretModel pret = PretModel.fromJson(requestsQuery.data()!);
    pret.id = requestsQuery.id;
    return pret;
  }

  Future<bool> deleteById(String id) async{
    await _db.collection("prets").doc(id).delete().then((value) =>null);
    return true;
  }
}