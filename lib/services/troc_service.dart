import 'package:cloud_firestore/cloud_firestore.dart';
import '/core/Models/troc_model.dart';

class TrocService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  TrocService();

  Future<TrocModel> create(TrocModel item) async{
    DocumentReference requestRef = _db.collection("trocs").doc();
    await requestRef.set(item.toJson());
    item.id = requestRef.id;
    return item;
  }

  Future<TrocModel> update(String trocId, TrocModel item) async{
    _db
      .collection("trocs")
      .doc(trocId)
      .update({...item.toJson()});

    return item;
  }

  Future <List<TrocModel>> getAll() async {
    QuerySnapshot<Map<String, dynamic>> requestsQuery =
      await _db.collection("trocs").get();

    List<TrocModel> trocs = requestsQuery.docs.map((d){
      TrocModel troc = TrocModel.fromJson(d.data());
      troc.id = d.id;
      return troc;
    }).toList();

    return trocs;
  }

  Future<TrocModel> getById(String id) async{
    DocumentSnapshot<Map<String, dynamic>> requestsQuery =
      await _db.collection("trocs").doc(id).get();

    TrocModel troc = TrocModel.fromJson(requestsQuery.data()!);
    troc.id = requestsQuery.id;
    return troc;
  }

  Future<bool> deleteById(String id) async{
    await _db.collection("trocs").doc(id).delete().then((value) =>null);
    return true;
  }
}