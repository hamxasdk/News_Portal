import 'package:flutter/material.dart';
import 'package:News_Portal/view/PoliticalNews/politicalAllNews.dart'
    as allNews;
import 'package:News_Portal/view/PoliticalNews/politicalNewsGallery.dart'
    as gallery;

class PoliticalNews extends StatefulWidget {
  @override
  _PoliticalNewsState createState() => _PoliticalNewsState();
}

class _PoliticalNewsState extends State<PoliticalNews>
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
        title: Text("Political News"),
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
              text: 'Political News',
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
          allNews.PoliticalAllNews(),
          gallery.PoliticalNewsGallery(),
        ],
      ),
    );
  }
}
