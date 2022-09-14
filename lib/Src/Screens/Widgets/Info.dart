import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  final double width;
  final double ratio;
  const Info({
    Key? key,
    required this.ratio,
    required this.width,
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
            '• I’m studying at Vactional High School Telkom Malang right now',
            style: GoogleFonts.getFont(
              'Delius',
              color: CustomColors.gray,
              fontSize: 13
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            '• My hobbies are playing games and watching movies',
            style: GoogleFonts.getFont(
                'Delius',
                color: CustomColors.gray,
                fontSize: 13
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            '• I know that there will be no END if we talk about tech,So I want to discover the new and the best technologies at the moment as fast as i can do',
            style: GoogleFonts.getFont(
                'Delius',
                color: CustomColors.gray,
                fontSize: 13
            ),
          ),
        ],
      ),
    );
  }
}
