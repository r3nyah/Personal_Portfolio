import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;
  const Description({
    Key? key,
    required this.width,
    required this.isVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical
          ? double.infinity
          : width * 0.29,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 135,
            height: 40,
            alignment: Alignment.center,
            color: CustomColors.primary,
            child: Center(
              child: Text(
                'Software Engineer',
                style: GoogleFonts.getFont(
                  'Delius',
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.015 * width,),
          Text(
            'I love peanuts in every universe',
            style: GoogleFonts.getFont(
              'Delius',
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            width: isVertical
                ? double.infinity
                : width * 0.29,
            height: 90,
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(seconds: 2),
              animatedTexts: [
                TyperAnimatedText(
                  'I am full stack mobile application developer',
                  textAlign: isVertical
                    ? TextAlign.center
                    : TextAlign.start,
                  textStyle: GoogleFonts.getFont(
                    'Delius',
                    color: CustomColors.gray,
                    fontSize: 15,
                  )
                ),
              ],
            ),
          ),
          InkWell(
            onTap: ()async => !await launch('https://mail.google.com/mail/u/0/?fs=1&to=r3nyah@gmail.com&tf=cm'),
            child: Text(
              'Contact me on!',
              style: GoogleFonts.getFont(
                'Delius',
                decoration: TextDecoration.underline,
                color: CustomColors.primary,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
