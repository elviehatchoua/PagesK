import 'dart:io';

//import 'package:finology/core/Models/troc_model.dart';
import 'package:finology/core/Models/pret_model.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/screen/Widgets/user_input.dart';
import 'package:finology/services/pret_service.dart';
import 'package:finology/services/services_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finology/Constance/constance.dart';
import 'package:provider/provider.dart';



class PretCreation extends StatefulWidget {
  String ? pretId;
  bool isEdit= false;
  String? user;
 

   PretCreation( {this.pretId, this.user,required this.isEdit,super.key});

  @override
  State<PretCreation> createState() => _PretCreationState();
}

class _PretCreationState extends State<PretCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey();

    TextEditingController descriptionController = TextEditingController();
    TextEditingController montantController = TextEditingController();
    var choosenDate;
    TextEditingController raisonController = TextEditingController();
    TextEditingController tauxInteretController = TextEditingController();
    bool isSwitched =false;

  
  //////////////////Fonction de l'application
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2030)
        )
        .then((pickedDate) {
      setState(() {
        choosenDate = pickedDate;
      });
    });
  }

  void _toggleState(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  var editPret = PretModel(
    description: "",
    montantDuPret: 0, 
    createdAt: DateTime.now(), 
    dateDeRembourssement: DateTime.now(), 
    raison: "", 
    tauxDinteret: 0, 
    userName:  "",
  );

  @override
  void initState() {
    if(widget.isEdit==true){
 print("nous sommes dans le edit le user name est ${widget.pretId!}");
    PretModel pretDetail = Provider.of<PretProvider>(context, listen: false)
              .getPretById(widget.pretId!);
  
    
    editPret = pretDetail;
    editPret.userName = widget.user!;
      
      setState(() {
          descriptionController =
            TextEditingController(
              text: editPret.description
            );

        montantController = 
            TextEditingController(
              text: editPret.montantDuPret.toInt().toString()
            );
        choosenDate = editPret.dateDeRembourssement;

        raisonController =
        TextEditingController(
          text: editPret.raison
        );

        tauxInteretController = 
        TextEditingController
        (
          text: editPret.tauxDinteret.toInt().toString()
        );
        
        isSwitched = editPret.status!;
        }
       );
    }
    super.initState();
    
  }

  Future<void> onSubmittedData () async { 
    int myIndex = Provider.of<PretProvider>(context, listen: false).getPretList.length;

    if(!_formKey.currentState!.validate()){
      return;
    }

    _formKey.currentState!.save();

     var newPret = PretModel(
      description: descriptionController.text,
      montantDuPret: double.parse(montantController.text), 
      createdAt: DateTime.now(), 
      dateDeRembourssement: choosenDate, 
      raison: raisonController.text, 
      tauxDinteret: int.parse(tauxInteretController.text), 
      userName: widget.user!,
      index: myIndex +1,
      status:isSwitched ,
      id: widget.isEdit == true ? widget.pretId : "0",
    

    ); 

  PretService pretService = ServiceFactory.createPretService();

    if(widget.isEdit==true)
    {
      PretModel editedPret =
        await pretService.update(newPret.id!, newPret);

      Provider.of<PretProvider>(context,listen:false)
        .editPret(editedPret);
    //Navigator.of(context).pop();
    }
    else
    {
      PretModel createdPret =
        await pretService.create(newPret);
      Provider.of<PretProvider>(context, listen: false)
        .addNewPret(createdPret);
    //Navigator.of(context).pop();

    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

  var TextTheme = Theme.of(context).textTheme;  
  final _user = Provider.of<User?>(context);
    widget.user = _user!.displayName!;
// print("nous sommes dans le widget le user name est ${widget.user}"); 
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: MediaQuery.of(context).size.width / 12,
        elevation: 10,
        title: Text('Faire un pret',style: TextTheme.titleLarge!.copyWith(fontSize: 18)),
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

            Container(
              height: 150,
              color: Colors.grey,
            ),
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
                                        SizedBox(
                                          height: 100, // <-- TextField height
                                          child: TextFormField(
                                              maxLines: null,
                                              expands: true,
                                              keyboardType: TextInputType.multiline,//1
                                              decoration: const InputDecoration(//2
                                                filled: true, 
                                                hintText: 'Description'
                                              ),
                                              controller: descriptionController,
                                                  
                                            ),
                                        ),
                                        UserInput(
                                          hint: 'Montant du pret', 
                                          iconUserInput:Icon(Icons.account_box),
                                          entryType: TextInputType.number, 
                                          label: 'Valeur net du pret',
                                          myColor: Colors.green,
                                          textController: montantController,
                                          isRequired: true,
                                          validatorMessage: "Veuillez entrer la valeur net du pret",
                                          enabled: true  
                                        ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          choosenDate == null
                                          ? Text(
                                              'Date de rembourssement',
                                              style: TextStyle(
                                              color: Theme.of(context).errorColor),
                                            )
                                          : Text('Choisit!',
                                              style:
                                                Theme.of(context).textTheme.titleLarge),
                                          TextButton(
                                            onPressed: _presentDatePicker,
                                            child: const Text('date')
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height: 100, // <-- TextField height
                                          child: TextFormField(
                                              maxLines: null,
                                              expands: true,
                                              keyboardType: TextInputType.multiline,//1
                                              decoration: const InputDecoration(//2
                                                filled: true, 
                                                hintText: 'raison du pret'
                                              ),
                                              controller: raisonController,
                                                  
                                            ),
                                      ),
                                        UserInput(
                                          hint: 'Taux d\'interet(en %)', 
                                          iconUserInput:Icon(Icons.account_box),
                                          entryType: TextInputType.number, 
                                          label: 'Interet du pret',
                                          myColor: Colors.green,
                                          textController: tauxInteretController,
                                          isRequired: true,
                                          validatorMessage: "Veuillez entrer le taux d'interet",
                                          enabled: true  
                                        ),
                                        const SizedBox(height: 30,),
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