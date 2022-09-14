import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Screens/Widgets/Description.dart';
import 'package:portfolio/Src/Screens/Widgets/Image.dart';

class UpperContainer extends StatelessWidget {
  final double width;
  const UpperContainer({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: CustomColors.brightBackground,
      padding: const EdgeInsets.only(bottom: 20),
      child: LayoutBuilder(
        builder: (context,consraints){
          if(consraints.maxWidth>=Breakpoints.lg){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.02),
                Description(
                  isVertical: false,
                  width: width,
                ),
                const SizedBox(width: 20),
                Images(
                  width: width,
                )
              ],
            );
          } else if (consraints.maxWidth < Breakpoints.lg && consraints.maxWidth >= Breakpoints.md) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.07),
                Images(width: (2 * width) - 0.16 * width),
                SizedBox(height: 0.05 * width),
                Description(
                  isVertical: true,
                  width: width,
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.07),
                Center(child: Images(width: 2 * width)),
                SizedBox(height: 0.05 * width),
                Description(isVertical: true, width: width),
              ],
            );
          }
        }),
    );
  }
}