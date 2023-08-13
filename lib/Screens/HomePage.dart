import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/ScienceNews.dart';
import 'package:flutter_application_1/Screens/Technology_screen.dart';
import 'package:flutter_application_1/Screens/TopNews.dart';
import 'package:flutter_application_1/Screens/entertainment.dart';
import 'package:flutter_application_1/Screens/sports.dart';

import 'Business_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> navBarItem = [
    "Business News",
    "Technology News",
    "Science News",
    "Sports News",
    "Top News",
    "Entertainment News"
  ];

  void _navigateToScreen(String item) {
    if (item == "Business News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BusinessScreen()),
      );
    }
    if (item == "Technology News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TechnologyScreen()),
      );
    }
    if (item == "Science News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ScienceScreen()),
      );
    }
    if (item == "Sports News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SportsScreen()),
      );
    }
    if (item == "Top News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TopScreen()),
      );
    }
    if (item == "Entertainment News") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EntertainmentScreen()),
      );
    }
  }

  // if(item == ){}
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of News'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: navBarItem.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToScreen(navBarItem[index]);
            },
            child: Card(
              elevation: 3,
              child: Center(
                child: Text(navBarItem[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
