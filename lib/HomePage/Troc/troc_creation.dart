import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:finology/Constance/constance.dart';
import 'troc_creating_head.dart';

class TrocCreation extends StatefulWidget {
  final Function addTroc;
  const TrocCreation(this.addTroc,{super.key});

  @override
  State<TrocCreation> createState() => _TrocCreationState();
}

class _TrocCreationState extends State<TrocCreation> {
  final valeurNetController = TextEditingController();
  final objetARecevoirController = TextEditingController();
  //final categorieController = TextEditingController();
  final commentaireController = TextEditingController();
  //final urgentController = TextEditingController();
  //final imageTrocController = TextEditingController();
  bool isSwitched =false;
  var imagePath;

  void _toggleState(bool value) {
    setState(() {
      isSwitched = value;
    });
  }
  void takeImagePath(XFile imagePicked){

    setState(() {
      imagePath=imagePicked ;
      
    });
  }

  void onSubmittedData () {
    final enterredvaleurNet = double.parse(valeurNetController.text);
    final enterredObjetARecevoir = objetARecevoirController.text;
    //final enterrredcategorie = double.parse(categorieController.text);
    final enterredCommentaire = commentaireController.text;

    if(enterredObjetARecevoir.isEmpty || enterredCommentaire.isEmpty || enterredvaleurNet <= 0)
    {
      return;
    }
    setState(() { 
      widget.addTroc(
        enterredvaleurNet,
        enterredObjetARecevoir,
        enterredCommentaire,
        imagePath,
        isSwitched
      );
    });

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    print('**********************the path of the image is $imagePath*************************');
  var TextTheme = Theme.of(context).textTheme;  
 // bool voirAutreChamp = false;
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: MediaQuery.of(context).size.width / 12,
        elevation: 10,
        title: Text('Creer un troc',style: TextTheme.headline6!.copyWith(fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right :defaultPadding - 5,
            ),
            child:  TextButton(
              onPressed: onSubmittedData, 
              child: const Text("Publier")
            )
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
        
          children: [
                  TrocCreatingHead(takeImagePath),
                  const SizedBox(height: 30,),
                   Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                     child: Card(
                      //elevation: 10,
                      color: Colors.white,
                        child: SizedBox(
                          height: 500,
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child:
                                Column(
                                    children:  <Widget> [
                                       TextField (
                                                  decoration:const InputDecoration(
                                                     enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 194, 216, 205)),
                                                     ),
                                                    icon: Icon(Icons.account_box),
                                                    iconColor: Colors.green,
                                                     labelText: 'Valeur net du produit',
                                                     hintText: 'Montant',
                                                  ),
                                                  controller: valeurNetController,
                                                  onSubmitted: (_) => onSubmittedData,
                                          ),
                                           TextField(
                                                  decoration:const InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 194, 216, 205)),
                                                     ),
                                                    icon: Icon(Icons.call),
                                                    iconColor: Colors.red,
                                                     labelText: 'Objet à recevoir',
                                                     hintText: 'Quel objet souhaitez-vous obtenir?',   
                                                  ),
                                                  controller: objetARecevoirController,
                                                  onSubmitted: (_) => onSubmittedData,
                                          ),
                                           const TextField(
                                                  decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 194, 216, 205)),
                                                     ),
                                                    icon: Icon(Icons.domain),
                                                    iconColor: Colors.orange,
                                                     labelText: 'Catégorie',
                                                     hintText: 'Choisissez une catégorie',  
                                                  ),

                                          ),
                                          const SizedBox(height: 30,),
                                          SizedBox(
                                            //width: 240, // <-- TextField width
                                            height: 100, // <-- TextField height
                                            child: TextField(
                                              maxLines: null,
                                              expands: true,
                                              keyboardType: TextInputType.multiline,
                                              decoration: const InputDecoration(filled: true, hintText: 'Dites quelque chose'),
                                              controller: commentaireController,
                                              onSubmitted: (_) => onSubmittedData,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                           ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('Urgent'),
                                            //const SizedBox(width: 10,),
                                            Switch(
                                              activeColor: Colors.blue,
                                              activeTrackColor: Colors.grey.shade400,
                                              inactiveThumbColor: Colors.blueGrey.shade600,
                                              inactiveTrackColor: Colors.grey.shade400,
                                              splashRadius: 50.0,
                                              value : isSwitched,
                                              onChanged: (value) => _toggleState(value)
                                              )
                                          ],
                                        ),
                                          /*  const SizedBox(
                                            height: 40,
                                           ),
                                           
                                           Center(
                                            child :TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    voirAutreChamp = true;
                                                  });
                                                },
                                               child: const Text ('Autre Champs', style: TextStyle(color : Colors.blue),)
                                              ),
                                          ), */
                                        ],
                                      ),
                                  ),
                            ),
                          
                        ),
                   ),
          ],
        ),
      ),
    );
  }
}
