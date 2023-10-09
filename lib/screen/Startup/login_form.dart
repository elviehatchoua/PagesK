import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';

import '../../services/authentification.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool inLoginProcess =false ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                decoration: BoxDecoration(
                  color: Colors.grey, 
              ),
              child:Image.asset(ConstanceData.claylogo,fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kabak',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.bold
                  ),   
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Découvrez notre application d\'échange et de partage',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.bold
                  ),   
                ),
              ),
              inLoginProcess 
              ?
              const  Center(child: CircularProgressIndicator(),)
              :
              Padding(
                padding: const EdgeInsets.only(top:110.0),
                child: ElevatedButton(
                  onPressed: ()=>signIn(), 
                  child: const Text('Connectez-vous avec Google')
                ),
              )
            ],
          ),
        )),
    );
  }
      signIn(){
      setState(() {
        inLoginProcess ==true; 
        AuthService().signInWithGoogle();
      });
    }
}