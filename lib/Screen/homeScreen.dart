import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/catoriesScreen.dart';
import 'package:flutter_application_1/Screen/headlinesDetail.dart';
import 'package:flutter_application_1/Screen/widget/widget.dart';
import 'package:flutter_application_1/provider/headlines.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList { arynews, bbcnews, independent, alJazerra, retures, cnn }

class _HomeScreenState extends State<HomeScreen> {
  FilterList? selectedMenu;

  String channelName = 'bbc-news';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final categoryprovider = Provider.of<GetNewsApi>(context, listen: false);
      categoryprovider.getCategoryNews('General');
      categoryprovider.getChannelChangedNews(channelName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final categoryprovider = Provider.of<GetNewsApi>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            onSelected: (FilterList item) {
              if (FilterList.bbcnews.name == item.name) {
                channelName = 'bbc-news';
                categoryprovider.getChannelChangedNews(channelName);
              }
              if (FilterList.arynews.name == item.name) {
                channelName = 'ary-news';
                categoryprovider.getChannelChangedNews(channelName);
              }
              if (FilterList.cnn.name == item.name) {
                channelName = "cnn";
                categoryprovider.getChannelChangedNews(channelName);
              }

              if (FilterList.alJazerra.name == item.name) {
                channelName = 'al-jazeera-english';
                categoryprovider.getChannelChangedNews(channelName);
              }
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
              const PopupMenuItem(
                value: FilterList.bbcnews,
                child: Text("BBC news"),
              ),
              const PopupMenuItem(
                value: FilterList.arynews,
                child: Text("ARY news"),
              ),
              const PopupMenuItem(
                value: FilterList.alJazerra,
                child: Text("ALJAZERRA news"),
              ),
              const PopupMenuItem(
                value: FilterList.cnn,
                child: Text("CNN news"),
              ),
            ],
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()),
            );
          },
          icon: Image.asset(
            'assets/images/category_icon.png',
            height: 25,
            width: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'NEWS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<GetNewsApi>(
            builder: (context, value, child) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  value.chanelChanged == null
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.chanelChanged!.articles!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HeadlineDetailScreen(
                                          index: index,
                                          channelName: channelName,
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: height * 0.5,
                                          width: width * 0.9,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: height * 0.02),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              value.chanelChanged!
                                                  .articles![index].urlToImage
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          right: 10,
                                          left: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              height: height * 0.16,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    value.chanelChanged!
                                                        .articles![index].title
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          value
                                                              .chanelChanged!
                                                              .articles![index]
                                                              .source!
                                                              .name
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                  const Divider(
                    thickness: 2.0,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  value.categoryChanged == null
                      ? const SpinKitCircle(
                          color: Colors.blue,
                          size: 50,
                        )
                      : GeneralNewsScreen(
                          value: value,
                          height: height,
                          width: width,
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
