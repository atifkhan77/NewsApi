import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';

import 'Screens.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(url: technologyUrl, text: "Technology Screen");
  }
}
