import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:google_fonts/google_fonts.dart';

class Interest extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String interest;
  const Interest({
    Key? key,
    required this.color,
    required this.interest,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: (textColor == Colors.black)
              ? CustomColors.primary
              : textColor,
        ),
      ),
      child: Center(
        child: Text(
          '' + interest,
          style: GoogleFonts.getFont(
            'Delius',
            color: textColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
