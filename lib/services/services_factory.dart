import 'package:finology/services/pret_service.dart';
import 'package:finology/services/troc_service.dart';

class ServiceFactory{
  static PretService createPretService(){
    return PretService();
  }

  static TrocService createTrocService(){
    return TrocService();
  }
}