import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';

class NavBarButton extends StatelessWidget {
  final Function onPressed;
  final double width;

  const NavBarButton({
    Key? key,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        return onPressed();
      },
      child: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        elevation: 4.0,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(
          width >= Breakpoints.md
              ? 0.03*width
              : 0.04*762,
        ),
        primary: CustomColors.darkBackground,
        onPrimary: CustomColors.brightBackground
      ),
    );
  }
}
