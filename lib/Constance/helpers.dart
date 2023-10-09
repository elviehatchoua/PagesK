import 'package:finology/core/Models/pret_model.dart';
import 'package:finology/core/Models/troc_model.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/providers/troc_provider.dart';
import 'package:finology/services/pret_service.dart';
import 'package:finology/services/services_factory.dart';
import 'package:finology/services/troc_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Go back in the history
pop(BuildContext context) {
  NavigatorState nav = Navigator.of(context);
  if (!nav.canPop()) return;
  nav.pop();
}

/// Open a page
push(BuildContext context, Widget page, {replace = false}) {
  NavigatorState nav = Navigator.of(context);

  MaterialPageRoute route =
      MaterialPageRoute(builder: (BuildContext context) => page);
  replace ? nav.pushReplacement(route) : nav.push(route);
}

Future<List<PretModel>> fetchPrets(BuildContext context) async {
  PretProvider pretProvider =
    Provider.of<PretProvider>(context, listen:false);
  PretService pretService = ServiceFactory.createPretService();
  List<PretModel>prets = await pretService.getAll();
  pretProvider.setPrets(prets);

  return prets;
}

Future<List<TrocModel>> fetchTrocs(BuildContext context) async {
  TrocProvider trocProvider =
    Provider.of<TrocProvider>(context, listen:false);
  TrocService trocService = ServiceFactory.createTrocService();
  List<TrocModel>trocs = await trocService.getAll();
  trocProvider.setTrocs(trocs);

  return trocs;
}

Future<void> initData(BuildContext context) async{
  await fetchPrets(context);
  await fetchTrocs(context);
}
