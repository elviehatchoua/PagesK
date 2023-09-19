// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'package:finology/screen/HomePage/Troc/detail_trop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Constance/constance.dart' as constance;
import 'Constance/constance.dart';
import 'Constance/theme.dart';
import 'providers/troc_provider.dart';
import 'screen/Home/Drawer/drawer.dart';
import 'screen/Home/Dashbord/dashbord_tab.dart';
import 'screen/Startup/enter_mobile_number.dart';
import 'screen/Startup/enter_otp.dart';
import 'screen/Startup/introduction.dart';
import 'screen/Startup/login.dart';
import 'screen/Startup/register.dart';
import 'screen/Splash/spash_screen.dart';
import 'screen/Startup/verity_your_identity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp()));
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
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
