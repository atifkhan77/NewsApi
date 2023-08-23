import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';
import 'package:flutter_application_1/Screens/HomePage.dart';
import 'package:provider/provider.dart';

import 'Api/detail_screen_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DetailedScreenProvider(topNewsUrl),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: HomeScreen()),
    );
  }
}
