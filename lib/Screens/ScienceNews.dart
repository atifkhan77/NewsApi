import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import 'Screens.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(url: scienceUrl, text: "Science Screen");
  }
}
