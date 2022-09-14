import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarItemWithIcon extends StatelessWidget {
  final String text;
  final String icon;
  final String url;

  const NavBarItemWithIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(CustomColors.brightBackground)
      ),
      icon: Image.asset(icon),
      onPressed: ()async{
        await launch(url);
      },
      label: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
