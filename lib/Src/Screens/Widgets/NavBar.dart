import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';
import 'package:portfolio/Src/Screens/Widgets/Logo.dart';
import 'package:portfolio/Src/Screens/Widgets/NavBarButton.dart';
import 'package:portfolio/Src/Screens/Widgets/NavBarItem.dart';
import 'package:portfolio/Src/Screens/Widgets/NavBarItemWithIcon.dart';

class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey interestKey;
  final GlobalKey skillsKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;

  NavBar({
    Key? key,
    required this.scrollController,
    required this.width,
    required this.skillsKey,
    required this.interestKey,
  }) : super(key: key){
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key){
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    scrollController.animateTo(y, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget navBarRow = Stack(children: [
      Padding(
        padding: EdgeInsets.only(
          left: width*0.04
        ),
        child: Logo(
          width: width,
          scrollController: scrollController,
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavBarItem(
            text: 'Home',
            onTap: (){},
          ),
          NavBarItem(
            text: 'Skills',
            onTap: (){
              return scrollToWidgetByKey(skillsKey);
            },
          ),
          NavBarItem(
            text: 'Interest',
            onTap: (){
              return scrollToWidgetByKey(interestKey);
            },
          ),
          const SizedBox(width: 50,),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 50,
          ),
          Row(
            children: const [
              NavBarItemWithIcon(
                text: 'Github',
                icon: ImageAssetConstants.transparent,
                url: 'https://github.com/r3nyah',
              ),
              SizedBox(width: 10,),
              NavBarItemWithIcon(
                text: 'Meta',
                icon: ImageAssetConstants.transparent,
                url: '',
              ),
              SizedBox(width: 10,),
              NavBarItemWithIcon(
                text: 'linkedIn',
                icon: ImageAssetConstants.transparent,
                url: '',
              ),
              SizedBox(width: 50,),
            ],
          )
        ],
      )
    ],);
    List<Widget>? navBarColumn = [
      NavBarItem(
        text: 'Home',
        onTap: (){
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10,),
      NavBarItem(
        text: 'Skills',
        onTap: (){
          scrollToWidgetByKey(skillsKey);
          collapsableHeight.value = 0.0;
        },
      ),
      const SizedBox(width: 10,),
      NavBarItem(
        text: 'Interest',
        onTap: (){
          scrollToWidgetByKey(interestKey);
          collapsableHeight.value = 0.0;
        },
      ),
      NavBarItem(
        text: 'Github',
        onTap: ()async{
          await launch('');
        },
      ),
      NavBarItem(
        text: 'Meta',
        onTap: ()async{
          await launch('');
        },
      ),
      NavBarItem(
        text: 'linkedIn',
        onTap: ()async{
          await launch('');
        },
      ),
    ];
    return Stack(
      children: [
        ObxValue<RxDouble>(
                (data) => AnimatedContainer(
              margin: const EdgeInsets.only(top: 110.0),
              duration: const Duration(milliseconds: 375),
              curve: Curves.ease,
              height: data.value,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: CustomColors.darkBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: navBarColumn,
                ),
              ),
            ),
            collapsableHeight),
        Container(
          height: 80.0,
          margin: const EdgeInsets.only(top: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: (width < Breakpoints.xlg)
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Logo(width: width,scrollController: scrollController,)),
              NavBarButton(
                  onPressed: () {
                    if (collapsableHeight.value == 0.0) {
                      collapsableHeight.value = 240.0;
                    } else if (collapsableHeight.value == 240.0) {
                      collapsableHeight.value = 0.0;
                    }
                  },
                  width: width),
            ],
          )
              : navBarRow,
        ),
      ],
    );
  }
}