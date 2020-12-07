import 'package:flutter/material.dart';
import 'package:News_Portal/view/InternationalNews/internationalAllNews.dart'
    as allNews;
import 'package:News_Portal/view/InternationalNews/internationalNewsDetails.dart';
import 'package:News_Portal/view/InternationalNews/internationalNewsGallery.dart'
    as gallery;

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews>
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
        title: Text("International News"),
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
              text: 'International News',
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
          allNews.InternationalAllNews(),
          gallery.InternationalNewsGallery(),
        ],
      ),
    );
  }
}
