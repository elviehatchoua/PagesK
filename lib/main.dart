// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:finology/Constance/helpers.dart';
import 'package:finology/providers/pret_provider.dart';
import 'package:finology/screen/HomePage/Troc/detail_trop.dart';
import 'package:finology/screen/HomePage/personal_page.dart';
import 'package:finology/screen/Startup/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Constance/constance.dart' as constance;
import 'Constance/constance.dart';
import 'Constance/theme.dart';
import 'core/Models/pret_model.dart';
import 'providers/troc_provider.dart';
import 'screen/Home/Drawer/drawer.dart';
import 'screen/Home/Dashbord/dashbord_tab.dart';
import 'screen/HomePage/Pret/detail_pret.dart';
import 'screen/HomePage/Troc/troc.dart';
import 'screen/Startup/enter_mobile_number.dart';
import 'screen/Startup/enter_otp.dart';
import 'screen/Startup/introduction.dart';
import 'screen/Startup/login.dart';
import 'screen/Startup/register.dart';
import 'screen/Splash/spash_screen.dart';
import 'screen/Startup/verity_your_identity.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/Startup/wrapper.dart';
import 'services/authentification.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBn5z6X5OY_CITq5jsJ6XEqYopV0pKhNa8", 
      appId:  "1:1070095976407:android:ce5bcce26abf50b569ad92", 
      messagingSenderId: "1070095976407", 
      projectId: "kabak-36bc7",
      storageBucket: "gs://kabak-36bc7.appspot.com"
      )
  )
  :await Firebase.initializeApp();

  runApp(
    
    MultiProvider(providers: [
      StreamProvider.value(
        initialData: null,
        value: AuthService().user,//cest elle qu'on retrouve et implémente dans authentification
      ),
    ],
    child: MyApp(),
    
    )
  );
 /*      MultiProvider(providers: [
      StreamProvider.value(
        initialData: null, 
        value: AuthService().user,//cest elle qu'on retrouve et implémente dans authentification
      )
    ],
    child: MyApp(),
  ) */
  //);
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        constance.primaryColorString =
            ConstanceData().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds: 1)).then(
        (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
              statusBarBrightness:
                  AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarDividerColor: Colors.grey,
              systemNavigationBarIconBrightness:
                  AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
            )));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TrocProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PretProvider(),
        )
      ],
      child: 
        GetMaterialApp(
          scrollBehavior: ScrollBehavior(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
          navigatorKey: NavKey.navKey,
          theme: AppTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          routes: routes,
        )
      );
    
  }

  var routes = <String, WidgetBuilder>{
    Routes.sPLASH: (BuildContext context) => SplashScreen(),
    Routes.lOGIN: (BuildContext context) => LoginScreen(),
    Routes.rEGISTER: (BuildContext context) => RegisterScreen(),
    Routes.verityYourIdentity: (BuildContext context) => VerityYourIdentity(),
    Routes.enterMobileNumber: (BuildContext context) => EnterMobileNumber(),
    Routes.enterOTP: (BuildContext context) => EnterOTP(),
    Routes.introduction: (BuildContext context) => IntroductionScreen(),
    Routes.costomeBottomBar: (BuildContext context) => OpenDrawer(),
    Routes.home: (BuildContext context) => Home(),
    Routes.detailtrop : (BuildContext context) => DetailTrop(),
    Routes.TROC : (BuildContext context) => Troc(),
    Routes.personnalpage :  (BuildContext context) => PersonalPage(),
    Routes.detailpret : (BuildContext context) => DetailPret(),
    Routes.loginForm : (BuildContext context) => LoginForm(),
    Routes.wrapper : (BuildContext context) => Wrapper(),
    
  };
}

class Routes {
  static String sPLASH = "/";
  static String lOGIN = "/Startup/login";
  static String rEGISTER = "/Startup/register";
  static String verityYourIdentity = "/Startup/verity_your_identity";
  static String enterMobileNumber = "/Startup/enter_mobile_number";
  static String enterOTP = "/Startup/enter_otp";
  static String introduction = "/Startup/introduction";
  static String costomeBottomBar = "/Home/costome_bottombar";
  static String home = "/Home/home";
  static String detailtrop =  "/detailtrop";
  static String TROC = "/HomePage/Troc";
  static String personnalpage= "/personnalpage";
  static String detailpret = "/HomePage/Pret/detail_pret";
  static String loginForm =  "/Startup/login_form";
  static String wrapper =  "/Startup/wrapper";



}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
