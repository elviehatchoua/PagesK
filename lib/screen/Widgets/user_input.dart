import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String hint;
  final Icon iconUserInput;
  final TextInputType entryType;
  final String label;
  final textController;
  bool? isRequired = true;
  bool? enabled = true;
  final String? validatorMessage;
  Function? dataSubmitted;
  int ? MymaxLines;
  Color ? myColor;

  UserInput({
    required this.hint,
    required this.iconUserInput,
    required this.entryType,
    required this.label,
    this.isRequired,
    this.enabled,
    this.validatorMessage,
    this.textController,
    this.dataSubmitted,
    this.MymaxLines,
    this.myColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.005, bottom: size.height * 0.002),
      child: TextFormField(
        maxLines: MymaxLines,
        decoration: InputDecoration(
          icon: (iconUserInput),
          iconColor: myColor,//Color.fromARGB(235, 139, 140, 159),
          label: Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
          hintStyle: const TextStyle(
              color: Color.fromARGB(235, 139, 140, 159), fontSize: 15),
          focusColor: Colors.green,
          hintText: hint,
        ),
        keyboardType: entryType,
        controller: textController,
        enabled: enabled,
        validator: (value) {
          if (isRequired!) {
            if (value!.isEmpty) {
              return validatorMessage;
            }
            return null;
          }
        },
        onFieldSubmitted: (_) {
          dataSubmitted;
        },
      ),
    );
  }
}
/* class UserInput extends StatelessWidget {
  String hint;
  String label;

   UserInput(this.hint, this.label,{super.key});

  @override
 Widget input(BuildContext context) {
    var size = MediaQuery.of(context).size;

  return Padding(
    padding:  EdgeInsets.only(top:size.height*0.05 , bottom:size.height*0.05),
    child: TextFormField(
     
      decoration: InputDecoration(
         /*  border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 2)
          ), */
          label:  Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.grey[100],
          focusColor: Colors.green,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red)
          ),

          hintText: hint,
          enabledBorder:const OutlineInputBorder(
            //borderSide: BorderSide(color: Color(0xFFF1F1F1)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
  /*         focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC7C7C7)),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ) */
    ),
    ),
  );
}

} */