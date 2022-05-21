import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/main/components/animated_circular_progress_indicator.dart';
import 'package:flutter_profile/screens/main/components/area_info_text.dart';
import 'package:flutter_profile/screens/main/components/my_info.dart';
import 'package:flutter_profile/screens/main/components/skills.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Coding()
            ]),
          ))
        ],
      ),
    );
  }
}

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Text(
          "Coding",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      Column(children: [
        AnimatedLinearProgressIndicator(
          lable: "Dart",
          percentage: 0.8,
        ),
        AnimatedLinearProgressIndicator(
          lable: "Python",
          percentage: 0.68,
        ),
        AnimatedLinearProgressIndicator(
          lable: "HTML",
          percentage: 0.9,
        ),
        AnimatedLinearProgressIndicator(
          lable: "CSS",
          percentage: 0.75,
        ),
        AnimatedLinearProgressIndicator(
          lable: "JavaScript",
          percentage: 0.58,
        )
      ])
    ]);
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator(
      {Key? key, required this.percentage, required this.lable})
      : super(key: key);
  final double percentage;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, double value, child) => Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lable,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text((value * 100).toInt().toString() + "%"),
                      ]),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  LinearProgressIndicator(
                    value: value,
                    color: primaryColor,
                    backgroundColor: darkColor,
                  ),
                ],
              )),
    );
  }
}
