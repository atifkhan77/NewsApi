import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';

import 'Screens.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReusableScreen(url: bussinessUrl, text: "Business Screen");
  }
}
