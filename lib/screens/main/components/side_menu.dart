import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/main/components/Knowledges.dart';
import 'package:flutter_profile/screens/main/components/animated_circular_progress_indicator.dart';
import 'package:flutter_profile/screens/main/components/area_info_text.dart';
import 'package:flutter_profile/screens/main/components/coding.dart';
import 'package:flutter_profile/screens/main/components/my_info.dart';
import 'package:flutter_profile/screens/main/components/skills.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(children: [
                AreaInfoText(
                  titile: "Residence",
                  text: "Sri Lanka",
                ),
                AreaInfoText(
                  titile: "City",
                  text: "Polonnaruwa",
                ),
                AreaInfoText(
                  titile: "Age",
                  text: "22",
                ),
                Skills(),
                SizedBox(
                  height: defaultPadding,
                ),
                Coding(),
                Knowledges(),
                Divider(),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            "DOWNLOAD CV",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          ),
                          SizedBox(
                            width: defaultPadding / 2,
                          ),
                          SvgPicture.asset("assets/icons/download.svg")
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: defaultPadding),
                  color: Color(0xFF24242e),
                  child: Row(children: [
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/github.svg")),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/twitter.svg")),
                    Spacer()
                  ]),
                )
              ]),
            ))
          ],
        ),
      ),
    );
  }
}
