import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Detail.dart.dart';
import 'package:flutter_application_1/Screens/HomePage.dart';

class ReusableScreen extends StatelessWidget {
  final String url;
  final String text;

  const ReusableScreen({
    Key? key,
    required this.url,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: DetailedScreen(url: url, text: text),
    );
  }
}
