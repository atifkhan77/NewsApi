import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/homeScreen.dart';
import 'package:flutter_application_1/provider/headlines.dart';
import 'package:provider/provider.dart';

class HeadlineDetailScreen extends StatefulWidget {
  const HeadlineDetailScreen(
      {super.key, required this.index, required this.channelName});
  final int index;
  final String channelName;

  @override
  State<HeadlineDetailScreen> createState() => _HeadlineDetailScreenState();
}

class _HeadlineDetailScreenState extends State<HeadlineDetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final categoryprovider = Provider.of<GetNewsApi>(context, listen: false);
      categoryprovider.getChannelChangedNews(widget.channelName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Consumer<GetNewsApi>(
          builder: (contex, value, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.chanelChanged!.articles![widget.index].title
                        .toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      value.chanelChanged!.articles![widget.index].urlToImage
                          .toString(),
                      height: height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value
                            .chanelChanged!.articles![widget.index].source!.name
                            .toString(),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white38),
                      child: SingleChildScrollView(
                        child: Text(
                          value.chanelChanged!.articles![widget.index].content
                              .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
