import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';
import 'package:flutter_application_1/Screens/Detail.dart.dart';
import 'package:flutter_application_1/Screens/HomePage.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: DetailedScreen(url: bussinessUrl, text: "Business Screen"));
  }
}
