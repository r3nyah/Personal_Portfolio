import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';
import 'package:portfolio/Src/Screens/Widgets/Footer.dart';
import 'package:portfolio/Src/Screens/Widgets/LowerContainer.dart';
import 'package:portfolio/Src/Screens/Widgets/UpperContainer.dart';
import 'package:portfolio/Src/Screens/Widgets/NavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<Map> interests;
  late final GlobalKey interestsKey;
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override void initState(){
    interestsKey = GlobalKey();
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    interests = [
      {
        'interest': 'Nilou',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'interest': 'Nilou',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
    ];

    scrollController.addListener(() {
      if(scrollController.offset >= Breakpoints.floatingButton){
        showFloatingButton.value = true;
      }else{
        showFloatingButton.value = false;
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: ObxValue<RxBool>(
              (data) => Visibility(
            visible: data.value,
            child: FloatingActionButton(
                onPressed: () => scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut),
                backgroundColor: CustomColors.primary,
                child: const Icon(Icons.arrow_upward,
                    color: CustomColors.darkBackground)),
          ),
          showFloatingButton),
      body: Container(
        color: CustomColors.brightBackground,
        width: width,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 130),
                  UpperContainer(width: width),
                  LowerContainer(
                      width: width,
                      interest: interests,
                      interestKey: interestsKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color:CustomColors.gray,
                  ),
                  Footer(width: width,scrollController: scrollController,),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                interestKey: interestsKey,
                key: homeKey,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}