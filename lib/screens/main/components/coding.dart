import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/main/components/animated_circular_progress_indicator.dart';

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
