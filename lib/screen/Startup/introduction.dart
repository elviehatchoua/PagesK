// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api, deprecated_member_use

import 'package:finology/Constance/constance.dart';
import 'package:finology/screen/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../main.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int initalPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (number) {
                setState(() {
                  initalPage = number;
                });
              },
              children: [
                introductionPages(),
                introductionPages(),
                introductionPages(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding * 4,
                      right: defaultPadding * 4,
                      top: defaultRadius,
                      bottom: MediaQuery.of(context).padding.bottom +
                          defaultPadding),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      initalPage == 0
                          ? SizedBox()
                          : Flexible(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    initalPage = initalPage - 1;
                                  });
                                  if (initalPage == 1) {
                                    _pageController.jumpToPage(1);
                                  }
                                  if (initalPage == 2) {
                                    _pageController.jumpToPage(1);
                                  }
                                },
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius)),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(width: initalPage == 0 ? 0 : defaultPadding),
                      Flexible(
                          flex: 3,
                          child: CustomButton(
                              onPressed: () {
                                setState(() {
                                  initalPage = initalPage + 1;
                                });
                                if (initalPage == 1) {
                                  _pageController.jumpToPage(1);
                                } else if (initalPage == 2) {
                                  _pageController.jumpToPage(2);
                                } else if (initalPage == 3) {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.costomeBottomBar);
                                }
                              },
                              icon: Icons.arrow_forward_outlined)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget introductionPages() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          child: Lottie.asset(
            initalPage == 0
                ? ConstanceData.manageMoneyJson
                : initalPage == 1
                    ? ConstanceData.investJson
                    : ConstanceData.financialFreedomJson,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 30),
        Text(
            initalPage == 0
                ? "Manage Money"
                : initalPage == 1
                    ? "Invest"
                    : "Financial Freedom",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Theme.of(context).primaryColor, fontSize: 25)),
        SizedBox(height: MediaQuery.of(context).size.height / 40),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 20 * 3),
      ],
    );
  }
}
