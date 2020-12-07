import 'package:flutter/material.dart';
import 'package:News_Portal/view/SportsNews/sportsAllNews.dart' as allNews;
import 'package:News_Portal/view/SportsNews/sportsNewsGallery.dart' as gallery;

class SportsNews extends StatefulWidget {
  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports News"),
        backgroundColor: Colors.grey.shade900,
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,
          tabs: [
            Tab(
              icon: Icon(
                Icons.view_headline,
              ),
              text: 'Sports News',
            ),
            Tab(
              icon: Icon(Icons.image),
              text: 'Gallery',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          allNews.SportsAllNews(),
          gallery.SportsNewsGallery(),
        ],
      ),
    );
  }
}
