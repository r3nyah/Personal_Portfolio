import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:get/get.dart';

class NavBarItem extends StatelessWidget {
  final String text;
  final Function onTap;
  late final RxBool isHighlighted;
  NavBarItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key){
    isHighlighted = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value){
        isHighlighted.value = true;
      },
      onExit: (value){
        isHighlighted.value = false;
      },
      child: ObxValue<RxBool>((data) {
        return InkWell(
          splashColor: Colors.white60,
          onTap: () => onTap(),
          child: Container(
            height: 40.0,
            width: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 6,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: data.value
                        ? CustomColors.primary
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                data.value
                    ? Container(
                  width: 40,
                  height: 1,
                  color: CustomColors.primary,
                )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        );
      }, isHighlighted),
    );
  }
}