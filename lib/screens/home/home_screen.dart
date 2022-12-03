import 'dart:developer';
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/main.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/models/Recommendation.dart';
import 'package:flutter_profile/models/repo.dart';
import 'package:flutter_profile/screens/home/component/homebanner.dart';
import 'package:flutter_profile/screens/main/main_screen.dart';

import '../main/components/heighlights.dart';
import '../main/components/my_projects.dart';
import '../main/components/recommendations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(children: [
      HomeBanner(),
      HighLightsInfo(),
      MyProjects(),
      Recommendations()
    ]);
  }
}
