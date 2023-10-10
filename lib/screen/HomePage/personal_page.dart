import 'package:finology/Constance/constance.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/providers/troc_provider.dart';
import 'package:finology/screen/HomePage/Pret/widgets/detail_pret_widget.dart';
import 'package:finology/screen/HomePage/Transfert/transfert.dart';
import 'package:finology/screen/HomePage/Troc/widgets/troc_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatefulWidget {
    
  PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  static List<Tab> tabs = [
    Tab(text: "Troc",),
    Tab(text: "Transfert",),
    Tab(text: "Pret",),

  ];
   @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this, 
      length: tabs.length
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    var TextTheme = Theme.of(context).textTheme;
    //final myTrocLIst = ModalRoute.of(context)!.settings.arguments as Map;
    final TrocL = Provider.of<TrocProvider>(context, listen: true).getTrocById(_user!.displayName!);
    final PretL = Provider.of<PretProvider>(context, listen: true).getListPretById(_user.displayName!);
    //final PretL = Provider.of<PretProvider>(context, listen: true).getListPretById(myTrocLIst['name']);
    print("la liste d'élement de la liste : ${TrocL}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white), 
        title: const Text("Account", ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 51, 5, 236),
        actions: []
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  color:  Color.fromARGB(255, 51, 5, 236),
                  height: 100,
                ),
                Positioned(
                   top: 30,
                   left:20,
                   child: Row(
                     children: [
                       CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(_user!.photoURL!),
                        ),
                        const SizedBox(width: 20,),
                        Text(_user.displayName!, style: TextStyle(color: Colors.white),),
                     ],
                   ),
                )
              ],
            ),
            Container(
              height: 90,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("info:", style: TextTheme.caption!.copyWith(color:Colors.blue) ),
                   const SizedBox(height: 10,),
                   const Text("+237 6 55 81 00 29")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              color: Colors.white,
              height: 650,
              child: Column(
                children: <Widget>[
                 
                  Container(
                     padding: EdgeInsets.all(defaultPadding - 5 ),
                    height: 70,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,),
                      child: TabBar(
                        enableFeedback: true,
                        controller: tabController,
                        labelColor: Colors.blue,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius - 5),
                          color: Color(0xff07b4f9).withOpacity(0.2)
                        ),
                        unselectedLabelColor: Theme.of(context).iconTheme.color,
                        labelStyle: Theme.of(context).textTheme.subtitle2,
                        tabs: tabs
                      ),
                  ),
                 
                  Expanded(
                    child: TabBarView (
                      controller: tabController,
                      children: <Widget>[
                         ListView(
                          children: 
                         TrocL.map
                          ((e){
                             return TrocItem(
                              isPersonal: true,
                              idTroc: e.id,
                              commentaire:e.descriptionTroc,  
                              imageTroc: e.imagePath, 
                              userName: e.userName, 
                              valeurNet: e.valeurNet, 
                              objetARecevoir:e.objetARecevoir,
                            ); 
                          }
                        ).toList()

                        ), 
                        Transfert(),
                        ListView(
                          children: PretL.map( 
                            (e){
                              return DetailPretItem(
                                userName: e.userName,
                                description: e.description,
                               montantDuPret: e.montantDuPret,
                               dateDeLaDemande: e.createdAt,
                               dateDeRembourssement: e.dateDeRembourssement,
                               raison: e.raison,
                               tauxDinteret : e.tauxDinteret,
                               idPret: e.id
                                
                              );
                            }
                        ).toList(),
                        )
                      ]
                    )
                  )

                ],
              )
            )
          ],
        ),
      ),
    );
  }
}