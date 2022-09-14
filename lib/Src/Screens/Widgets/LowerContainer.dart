import 'package:flutter/material.dart';
import 'package:portfolio/Src/Utils/BreakPoints.dart';
import 'package:portfolio/Src/Utils/CustomColors.dart';
import 'package:portfolio/Src/Utils/ImageAssetConstants.dart';
import 'package:portfolio/Src/Screens/Widgets/Info.dart';
import 'package:portfolio/Src/Screens/Widgets/HelloWithBio.dart';
import 'package:portfolio/Src/Screens/Widgets/Interest.dart';
import 'package:portfolio/Src/Screens/Widgets/SkillCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class LowerContainer extends StatelessWidget {
  final double width;
  final List<Map> interest;
  final GlobalKey interestKey;
  final GlobalKey skillsKey;
  const LowerContainer({
    Key? key,
    required this.width,
    required this.interest,
    required this.interestKey,
    required this.skillsKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      key: skillsKey,
      color: CustomColors.darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          LayoutBuilder(builder: (context,constraints){
            if(constraints.maxWidth >= Breakpoints.lg){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkillCard(
                        title: 'Flutter Development',
                        description: 'I am developing android,ios, and web application using flutter platform framework',
                        icon: ImageAssetConstants.logoFlutter,
                        width: width,
                        ratio: 0.5,
                      ),
                      const SizedBox(height: 10,),
                      SkillCard(
                        title: 'Android Development',
                        description: 'I am developing android application that written on java and kotlin',
                        icon: ImageAssetConstants.logoAndroid,
                        width: width,
                        ratio: 0.5,
                      ),
                    ],
                  ),
                  SizedBox(width: 0.05 * width,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HelloWithBio(width: 0.4, ratio: width),
                      const SizedBox(height: 30,),
                      Info(width: width,ratio: 0.4,),
                    ],
                  )
                ],
              );
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkillCard(
                        title: 'Flutter Development',
                        description: 'I am developing android,ios, and web application using flutter platform framework',
                        icon: ImageAssetConstants.logoFlutter,
                        width: width*2,
                        ratio: 0.45,
                      ),
                      const SizedBox(height: 10,),
                      SkillCard(
                        title: 'Android Development',
                        description: 'I am developing android application that written on java and kotlin',
                        icon: ImageAssetConstants.logoAndroid,
                        width: width*2,
                        ratio: 0.45,
                      ),
                    ],
                  ),
                  SizedBox(width: 0.05 * width,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HelloWithBio(width: 0.4, ratio: width),
                      const SizedBox(height: 30,),
                      Info(width: width,ratio: 0.4,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      HelloWithBio(
                        width: 3*width,
                        ratio: 0.3,
                      ),
                      const SizedBox(height: 35,),
                      Info(
                        width: 3*width,
                        ratio: 0.3,
                      ),
                    ],
                  )
                ],
              );
            }
          }),
          SizedBox(height: width*0.07,),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: width>=Breakpoints.lg
                  ?width*0.1
                  :width*0.05,
            ),
            child: Text(
              'I`m interest on',
              style: GoogleFonts.getFont(
                'Delius',
                color: Colors.white,
                fontSize: 19
              ),
            ),
          ),
          SizedBox(height: width*0.03),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= Breakpoints.lg) {
              return SizedBox(
                width: width * 0.76,
                height: 100,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 8,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) => Interest(
                    interest: interest[index]['interest'],
                    color: interest[index]['color'],
                    textColor: interest[index]['textColor'],
                    key: index == 4 ? interestKey : null,
                  ),
                  staggeredTileBuilder: (int index) =>
                  const StaggeredTile.fit(
                    2,
                  ),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 40.0,
                ),
              );
            } else if (constraints.maxWidth < Breakpoints.lg &&
                constraints.maxWidth >= Breakpoints.sm) {
              return SizedBox(
                width: width * 0.76,
                height: 180,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 8,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) => Interest(
                    interest: interest[index]['interest'],
                    color: interest[index]['color'],
                    textColor: interest[index]['textColor'],
                    key: index == 4 ? interestKey : null,
                  ),
                  staggeredTileBuilder: (int index) =>
                  const StaggeredTile.fit(
                    4,
                  ),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 40.0,
                ),
              );
            } else {
              return SizedBox(
                width: width * 0.76,
                height: 360,
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 8,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) => Interest(
                    interest: interest[index]['interest'],
                    color: interest[index]['color'],
                    textColor: interest[index]['textColor'],
                    key: index == 4 ? interestKey : null,
                  ),
                  staggeredTileBuilder: (int index) =>
                  const StaggeredTile.fit(
                    8,
                  ),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 40.0,
                ),
              );
            }
          }),
          const SizedBox(height:10)

        ],
      ));
  }
}