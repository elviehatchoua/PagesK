// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_this, use_key_in_widget_constructors, deprecated_member_use, unused_import, non_constant_identifier_names, unused_local_variable, unused_element, library_private_types_in_public_api

//import 'dart:developer';
import 'package:animations/animations.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/screen/HomePage/Pret/detail_pret.dart';
import 'package:finology/screen/HomePage/Transfert/transfert.dart';

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';

import '../../Constance/helpers.dart';
import '../Home/Accounts/account.dart';
import '../Home/Dashbord/dashbord_tab.dart';
import '../Home/Wallet/wallet.dart';
import '../HomePage/Troc/troc.dart';
import '../HomePage/personal_page.dart';
import '../Startup/login_form.dart';
import 'dialog_notification.dart';


bool status = AppTheme.isLightTheme ? false : true;
int currentIndex = 1;
List<Widget> currentPage = [
  PersonalPage(),
  //AccountScreen(),
  Troc(),
  AccountScreen(),
  //WalletScreen(),

];

class CostomeBottomBar extends StatefulWidget {
  @override
  _CostomeBottomBarState createState() => _CostomeBottomBarState();
}

class _CostomeBottomBarState extends State<CostomeBottomBar> {


  init() async{
    
   
      try{
        await initData(context);
      } catch(e) {
         if (e.toString().contains("Failed host lookup")) {
          NotificationDialog.showCustomDialog(
              context: context,
              title: "Network issues!",
              content: "",
              isPop: true,
              isSuccess: false,
              isRedirect: true,
              page: const LoginForm());
        } else {
          NotificationDialog.showCustomDialog(
              context: context,
              title: "An error occured",
              content: "",
              isPop: true,
              isSuccess: false,
              isRedirect: true,
              page: const LoginForm());
        }
      }
    
    
  }

   @override
  void initState() {
    super.initState();
    init();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          //Navigator.pop(context);
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
        return true;
      },
      child: Scaffold (
          body: PageTransitionSwitcher(
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: currentPage[currentIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Theme.of(context).disabledColor)
              ],
            ),
            height: MediaQuery.of(context).padding.bottom + 55,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() => currentIndex = 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 9,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 0
                                  ? FontAwesomeIcons.solidListAlt
                                  : FontAwesomeIcons.listAlt,
                              color: currentIndex == 0
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 23),
                          SizedBox(height: 5),
                          Text("Acc..",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 0
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(width:MediaQuery.of(context).size.width / 9 ,),
                  InkWell(
                    onTap: () => setState(() => currentIndex = 1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 1
                                  ? Icons.account_balance_rounded
                                  : Icons.account_balance_outlined,
                              color: currentIndex == 1
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 24),
                          SizedBox(height: 3),
                          Text("Accueil",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 1
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(width: defaultPadding * 3),
                  InkWell(
                    onTap: () => setState(() => currentIndex = 2),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 9,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              currentIndex == 2
                                  ? Icons.account_balance_wallet_rounded
                                  : Icons.account_balance_wallet_outlined,
                              color: currentIndex == 2
                                  ? AppTheme.isLightTheme
                                      ? Theme.of(context).primaryColor
                                      : blueColor
                                  : Theme.of(context).iconTheme.color,
                              size: 24),
                          SizedBox(height: 5),
                          Text("Tra..",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    color: currentIndex == 2
                                        ? AppTheme.isLightTheme
                                            ? Theme.of(context).primaryColor
                                            : blueColor
                                        : Theme.of(context).iconTheme.color,
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         ),
    );
  }
}

