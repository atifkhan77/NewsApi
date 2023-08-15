import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';

import 'Screens.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(
        url: entertainmentUrl, text: "Entertainment Screen");
  }
}
