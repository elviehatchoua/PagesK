
import 'dart:io';

import 'package:finology/core/Models/troc_model.dart';
import 'package:finology/providers/troc_provider.dart';
import 'package:finology/screen/Widgets/user_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:finology/Constance/constance.dart';
import 'package:provider/provider.dart';
import '../../Widgets/bottom_sheet.dart';
import 'troc_creating_head.dart';

class TrocCreation extends StatefulWidget {
  String ? trocId;
  bool isEdit= false;
 // final Function ? addTroc;
   TrocCreation( {this.trocId,required this.isEdit,super.key});

  @override
  State<TrocCreation> createState() => _TrocCreationState();
}

/*
*  var     imagePath;
  double  valeurNet;
  String  objetARecevoir;
  String  descriptionTroc;
  bool    isUrgent;
  String categorie; 
  String  userName;
 */

class _TrocCreationState extends State<TrocCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController valeurNetController = TextEditingController();
  TextEditingController objetARecevoirController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categorieController = TextEditingController();
  var newTroc;
  var imagePath;
  bool isSwitched =false;
  

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
  @override
  void initState() {
    if(widget.isEdit==true){
      TrocModel trocDetail = Provider.of<TrocProvider>(context,listen: false)
          .trocList.firstWhere((troc) => troc.id == widget.trocId );
        setState(() {
          valeurNetController = 
            TextEditingController(
              text: trocDetail.valeurNet.toInt().toString()
            );
          objetARecevoirController =
            TextEditingController(
              text: trocDetail.objetARecevoir
            );
          categorieController =
            TextEditingController(
              text: trocDetail.categorie
            );
          descriptionController =
            TextEditingController(
              text: trocDetail.descriptionTroc
            );
          imageFileHead = trocDetail.imagePath;
          print("My image :::::${imagePath}");
      
        }
       );
    }
    super.initState();
    
  }

  void onSubmittedData () { 

    if(!_formKey.currentState!.validate()){
      return;
    }

    _formKey.currentState!.save();

    final enterredValeurNet = double.parse(
        valeurNetController.text
    ),
    newTroc = TrocModel(
      imagePath: imageFileHead,
      objetARecevoir: objetARecevoirController.text, 
      valeurNet: enterredValeurNet <=0 ? 0 :enterredValeurNet, 
      isUrgent: isSwitched, 
      descriptionTroc: descriptionController.text, 
      userName: "1", 
      categorie: categorieController.text,
      id: widget.isEdit! == true ? widget.trocId : "0",

    );
    if(widget.isEdit==true)
    {
      Provider.of<TrocProvider>(context,listen:false)
        .editTroc(newTroc);
      //Navigator.of(context).pop();
    }
    else
    {
    Provider.of<TrocProvider>(context, listen: false)
      .addNewTroc(newTroc);
     // Navigator.of(context).pop();

    }
    Navigator.of(context).pop();
  }
  var imageFileHead;

   void photoFile (XFile imagePicked) {
   print(' --------------------image picked: $imagePicked');
    setState(() {
        //widget.imageFileHead = imagePicked;
        imageFileHead = imagePicked;
       
      
    });
   }

   void _showMyBottomSheet (context) {
    showModalBottomSheet(
      elevation:10,
      backgroundColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
           top: Radius.circular(50)
         )
       ),
       context: context, 
       builder: (context) {
         return  MyBottomSheet(photoFile);
        }
    );
}
//final scaffoldState = GlobalKey<ScaffoldState>();

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
        title: Text('Creer un troc',style: TextTheme.titleLarge!.copyWith(fontSize: 18)),
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
            Stack (
                  clipBehavior: Clip.none, // les elements se cachent ou non
                  alignment: Alignment.center,
                  children: <Widget>[
                      imageFileHead == null 
                    ?
                      Container(
                          height: 150,
                          color: Colors.grey,
                    
                        )
                    : 
                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child:  imageFileHead is String 
                      ?
                       Image.asset( imageFileHead,fit: BoxFit.cover)
                      : 
                       Image.file( File( imageFileHead.path) , fit: BoxFit.cover),

                    ),
                    Positioned(
                        top: imageFileHead == null ? 120 : 230,
                        right:20,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor:  imageFileHead == null ? Colors.blue : Colors.grey,
                          child: InkWell(
                             onTap: () {
                             _showMyBottomSheet(context);
                            }, 
                            child: const Icon(Icons.add_a_photo_outlined)
                          ),
                        ),
                      ), 
                   
                  ],
    ),
                  /* TrocCreatingHead(
                    widget.isEdit == true 
                    ?
                      null: takeImagePath,
                    
                     widget.isEdit == true 
                    ? 
                      imagePath : null,

                     isReceive: widget.isEdit== true 
                    ?
                    true:false,
                  ), */
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
                                Form(
                                  key:_formKey ,
                                  child: Column(
                                      children:  <Widget> [
                                        UserInput(
                                          hint: 'Montant', 
                                          iconUserInput:Icon(Icons.account_box),
                                          entryType: TextInputType.number, 
                                          label: 'Valeur net du produit',
                                          myColor: Colors.green,
                                          textController: valeurNetController,
                                          isRequired: true,
                                          validatorMessage: "Veuillez entrer la valeur net du produit",
                                          enabled: true
                                         
                                        ),
                                       
                                        UserInput(
                                          hint: 'Quel objet souhaitez-vous obtenir?', 
                                          iconUserInput:Icon(Icons.call),
                                          entryType: TextInputType.name, 
                                          label: 'Objet à recevoir',
                                          myColor:  Colors.red,
                                          textController: objetARecevoirController,
                                          isRequired: true,
                                          validatorMessage: "Veuillez entrer l'objet d'échange",
                                          enabled: true,

                                       
                                        ),
                                        UserInput(
                                          hint:  'Choisissez une catégorie',  
                                          iconUserInput:Icon(Icons.domain),
                                          entryType: TextInputType.name, 
                                          label: 'Catégorie',
                                          myColor:  Colors.orange,
                                          textController: categorieController,
                                          isRequired: false,
                                          enabled: true,

                                       
                                        ),
                                        const SizedBox(height: 30,),
                                       SizedBox(
                                              height: 100, // <-- TextField height
                                              child: TextFormField(
                                                maxLines: null,
                                                expands: true,
                                                keyboardType: TextInputType.multiline,//1
                                                decoration: const InputDecoration(//2
                                                  filled: true, 
                                                  hintText: 'Dites quelque chose'
                                                ),
                                                controller: descriptionController,
                                                
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
                                          ],
                                        ),
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


