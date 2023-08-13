import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/constants.dart';
import 'package:flutter_application_1/Screens/Detail.dart.dart';
import 'package:flutter_application_1/Screens/HomePage.dart';

class EntertainmentScreen extends StatefulWidget {
  const EntertainmentScreen({super.key});

  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
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
        body: DetailedScreen(
            url: entertainmentUrl, text: "Entertainment Screen"));
  }
}
