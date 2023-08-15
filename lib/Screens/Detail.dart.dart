import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Navigation/newsScreen.dart';
import '../Api/api.dart';

class DetailedScreen extends StatefulWidget {
  final String url;
  final String text;

  const DetailedScreen({Key? key, required this.url, required this.text})
      : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  double height = 50;
  double width = 50;
  final double height1 = 50;
  final double width1 = 300;
  final Color border_color = Colors.white;
  Color color = Colors.transparent;
  late Future<List> newsArticles;

  @override
  void initState() {
    newsArticles = NewsApiHelper(widget.url).fetchNewsArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
      body: FutureBuilder<List>(
        future: newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List listResponse = snapshot.data!;

            return SingleChildScrollView(
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
                                  setState(() {
                                    color = Colors.black;
                                    height = 0.0;
                                    width = 0.0;
                                  });
                                },
                                onDoubleTap: () {
                                  setState(() {
                                    color = color;
                                    Colors.white;
                                    height = 0.0;
                                    width = 0.0;
                                  });
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
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber,
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://cleantechnica.com/files/2023/08/2023_06_Electrify_DC_JoseValdezPhoto-2305-meguiars-aj-velasco-tesla-model-3-best-of-show-scaled.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height,
                    width: screenSize.width * 0.9,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listResponse.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsScreen(
                                    img: listResponse[index]['urlToImage'],
                                    description: listResponse[index]
                                        ['description'],
                                    author: listResponse[index]['author'],
                                    title: listResponse[index]['title']),
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: screenSize.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.deepPurple, width: 0.5),
                            ),
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
                                              listResponse[index]
                                                  ['urlToImage']),
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
                                            text: listResponse[index]
                                                ['description'],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 20),
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
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
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
            );
          } else {
            return const Center(
              child: Text("No data available."),
            );
          }
        },
      ),
    );
  }
}
