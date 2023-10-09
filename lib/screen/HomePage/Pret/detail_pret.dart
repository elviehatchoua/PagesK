import 'package:carousel_slider/carousel_slider.dart';
import 'package:finology/Constance/constance.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/screen/HomePage/Pret/widgets/detail_pret_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/user_idea.dart';

class DetailPret extends StatefulWidget {
   DetailPret({super.key});

  @override
  State<DetailPret> createState() => _DetailPretState();
}


class _DetailPretState extends State<DetailPret> with TickerProviderStateMixin  {
  final CarouselController carouselController = CarouselController();
    int currentIndex =0;
    late AnimationController controller;
    bool isAutoPlayEnabled = true;
    bool isProgressIndicatorPlaying = true; 

  @override
  void didChangeDependencies() {
    controller = AnimationController(

      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
    final pretList = Provider.of<PretProvider>(context, listen: true).getPretList;
   final myPret = ModalRoute.of(context)!.settings.arguments as Map;
    final PretI = Provider.of<PretProvider>(context, listen: true).getPretById(myPret['pretid']);


    return Scaffold(

      body:Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                isAutoPlayEnabled =! isAutoPlayEnabled;
                isProgressIndicatorPlaying = ! isProgressIndicatorPlaying;
                isProgressIndicatorPlaying ? controller.forward(from:(controller.value)-0.7) : controller.stop();
              });
            },
            child: CarouselSlider(
                            items: pretList.map((item) => DetailPretItem(
                               description: item.description,
                               montantDuPret: item.montantDuPret,
                               dateDeLaDemande: item.createdAt,
                               dateDeRembourssement: item.dateDeRembourssement,
                               raison: item.raison,
                               tauxDinteret : item.tauxDinteret,
                               userName : item.userName,
                               idPret: item.id
                            )
                                ).toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              pauseAutoPlayOnTouch: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              height: 900,
                              initialPage: PretI.index!,
                              //initialPage: int.parse(PretI.id!.replaceAll(RegExp(r'[^0-9]'), '')),
                              scrollDirection: Axis.horizontal,
                              scrollPhysics: const BouncingScrollPhysics(),
                              aspectRatio: 2,
                              viewportFraction: 1, //to see only one elmt on the screen
                              onPageChanged: (index, reason) {
                                setState(() {
                                  print("my  index ${index}");
                
                                       currentIndex == index;
                                });
                              controller.forward(from: 0); 

                              }
                            ),           
                  ),
          ),
        
       Align(
          alignment: Alignment.bottomCenter,
            child:             LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
        ) 
        ]
      ),
    );
  }
}