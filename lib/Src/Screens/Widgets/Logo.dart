import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';

class Logo extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Logo({
    Key? key,
    required this.scrollController,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
          ImageAssetConstants.logo,
          width: width >= Breakpoints.xlg
            ? width*0.14
            : Breakpoints.xlg*0.14,
          height: width >= Breakpoints.xlg
            ? 0.04*width
            : 0.04*Breakpoints.xlg,
        ),
      ),
    );
  }
}
