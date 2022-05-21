import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';

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