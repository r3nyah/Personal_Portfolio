import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloWithBio extends StatelessWidget {
  final double width;
  final double ratio;
  const HelloWithBio({
    Key? key,
    required this.width,
    required this.ratio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width * ratio,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello World!I am r3nyah',
            style: GoogleFonts.getFont(
              'Delius',
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'you can call me renyah,but I still prefer that you call me darling',
            style: GoogleFonts.getFont(
              'Delius',
              color: CustomColors.gray,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
