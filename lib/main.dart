import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';
import 'package:portfolio/Src/Screens/Widgets/Footer.dart';
import 'package:portfolio/Src/Screens/Widgets/LowerContainer.dart';
import 'package:portfolio/Src/Screens/Widgets/UpperContainer.dart';
import 'package:portfolio/Src/Screens/Widgets/NavBar.dart';
import 'package:portfolio/Src/Screens/Screen/Home.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColors.primary,
    statusBarColor: CustomColors.primary,
  ));

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: CustomColors.primary,
      splashColor: CustomColors.primary,
      highlightColor: CustomColors.primary,
    ),
    title: 'r3nyah',
    home: const Home(),
    debugShowCheckedModeBanner: false,
  ));
}