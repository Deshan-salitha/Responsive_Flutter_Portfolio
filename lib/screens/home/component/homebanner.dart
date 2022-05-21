import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.jpeg",
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Discover my Amazing \nArt Space",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    MyBuildAnimatedText(),
                    SizedBox(height: defaultPadding,),
                    ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 2,
                                vertical: defaultPadding),
                            backgroundColor: primaryColor),
                        child: Text(
                          "EXPLORE NOW",
                          style: TextStyle(color: darkColor),
                        ))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          FlutterCodeedText(),
          SizedBox(
            width: defaultPadding / 2,
          ),
          Text("I build "),
          AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(
              "responsive web and mobile app.",
              speed: Duration(milliseconds: 60),
            ),
            TyperAnimatedText(
              "complete e-commerce app UI.",
              speed: Duration(milliseconds: 60),
            ),
            TyperAnimatedText(
              "Chat app with dart and light theme.",
              speed: Duration(milliseconds: 60),
            ),
          ]),
          SizedBox(
            width: defaultPadding / 2,
          ),
          FlutterCodeedText(),
        ],
      ),
    );
  }
}

class FlutterCodeedText extends StatelessWidget {
  const FlutterCodeedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: "<", children: [
      TextSpan(text: "flutter", style: TextStyle(color: primaryColor)),
      TextSpan(text: ">")
    ]));
  }
}