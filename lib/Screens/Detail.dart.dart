import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/newsScreen.dart';
import 'package:http/http.dart' as http;

class DetailedScreen extends StatefulWidget {
  final String url;
  final String text;
  const DetailedScreen({super.key, required this.url, required this.text});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  double height = 50;
  double width = 50;
  double height1 = 50;
  double width1 = 300;
  Color border_color = Colors.white;
  Color color = Colors.transparent;

  String? stringResponse;
  Map? mapResponse;
  List listResponse = [];

  Future apiCall() async {
    http.Response response;

    response = await http.get(Uri.parse(widget.url));

    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["articles"];
      });
    } else {
      debugPrint("Error in loading!!!");
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
        title: const Text(
          "Taza Khabar",
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 20),
                  height: height1,
                  width: width1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 20),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(color: border_color, width: 0.0),
                      borderRadius: BorderRadius.circular(10),
                      color: color),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            color = color;

                            Colors.black;
                            height = 0.0;
                            width = 0.0;
                            setState(() {});
                          },
                          onDoubleTap: () {
                            color = color;

                            Colors.white;
                            height = 0.0;
                            width = 0.0;
                            setState(() {});
                          },
                          child: const Icon(Icons.search),
                        ),
                        const Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.amber,
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://cleantechnica.com/files/2023/08/2023_06_Electrify_DC_JoseValdezPhoto-2305-meguiars-aj-velasco-tesla-model-3-best-of-show-scaled.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listResponse.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(
                              img: listResponse[index]['urlToImage'],
                              description: listResponse[index]['description'],
                              author: listResponse[index]['author'],
                              title: listResponse[index]['title']),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.deepPurple, width: 0.5)),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        listResponse[index]['urlToImage']),
                                    fit: BoxFit.cover)),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 20),
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: listResponse[index]['description'],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Source",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "BBC",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "10 min ago",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        size: 12,
                                        color: Colors.deepPurple,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Icon(
                                          Icons.share,
                                          size: 12,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
