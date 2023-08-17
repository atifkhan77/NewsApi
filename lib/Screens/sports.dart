import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import 'Screens.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(url: sportsUrl, text: "Sports Screen");
  }
}
