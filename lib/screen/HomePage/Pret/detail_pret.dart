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
 
    final pretList = Provider.of<PretProvider>(context, listen: true).MyPretList;
   final myPret = ModalRoute.of(context)!.settings.arguments as Map;
    final PretI = Provider.of<PretProvider>(context, listen: true).getPretById(myPret['pretid']);


    return Scaffold(

      body:Stack(
        children: [
          CarouselSlider(
                          items: pretList.map((item) => DetailPretItem(
                             description: item.description,
                             montantDuPret: item.montantDuPret,
                             dateDeLaDemande: item.dateDeLaDemande,
                             dateDeRembourssement: item.dateDeRembourssement,
                             raison: item.raison,
                             tauxDinteret : item.tauxDinteret,
                             userName : item.userName,
                             idPret: item.id
                          )
                              ).toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            autoPlayInterval: Duration(seconds: 5),
                            height: 900,
                            initialPage: int.parse(PretI.id!)-1,
                            scrollDirection: Axis.horizontal,
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                print("my  index ${index}");
      
                                     currentIndex == index;
                              });
                            }
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