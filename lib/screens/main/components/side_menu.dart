import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/main/components/my_info.dart';

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
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Text(
                  "Skills",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              AnimatedCircularProgressIndicator()
            ]),
          ))
        ],
      ),
    );
  }
}

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: defaultDuration,
              builder: (context, double value, child) => Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: value,
                        color: primaryColor,
                        backgroundColor: darkColor,
                      ),
                      Center(
                        child: Text(
                          (value * 100).toInt().toString() + "%",
                          style:
                              Theme.of(context).textTheme.subtitle1,
                        ),
                      )
                    ],
                  )),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          "Flutter",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({Key? key, this.titile, this.text}) : super(key: key);

  final String? titile;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          titile!,
          style: TextStyle(color: Colors.white),
        ),
        Text(text!),
      ]),
    );
  }
}
