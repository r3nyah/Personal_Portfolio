import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';

class Images extends StatelessWidget {
  final double width;
  const Images({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 370,
          ),
          child: Image.asset(
            ImageAssetConstants.image,
            width: width * 0.29,
            height: width * 0.3,
          ),
        ),

      ],
    );
  }
}