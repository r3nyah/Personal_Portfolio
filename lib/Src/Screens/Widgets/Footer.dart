import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Screens/Widgets/Logo.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({
    Key? key,
    required this.scrollController,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkBackground,
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(
            width: width,
            scrollController: scrollController,
          ),
          const SizedBox(height: 22,),
          width > Breakpoints.sm ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Copyright © 2022 r3nyah',
                style: GoogleFonts.getFont(
                  'Delius',
                  color: CustomColors.gray,
                  fontSize: 14
                ),
              ),
              Text(
                'All rights reserved',
                style: GoogleFonts.getFont(
                  'Delius',
                  color: CustomColors.gray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'r3nyah',
                style: GoogleFonts.getFont(
                  'Delius',
                  color: CustomColors.gray,
                  fontSize: 14,
                ),
              )
            ],
          ):Column(

          ),
        ],
      ),
    );
  }
}
