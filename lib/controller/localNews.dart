import 'package:flutter/material.dart';
import 'package:News_Portal/view/LocalNews/localAllNews.dart' as allNews;
import 'package:News_Portal/view/LocalNews/localNewsGallery.dart' as gallery;

class LocalNews extends StatefulWidget {
  @override
  _LocalNewsState createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews>
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
        title: Text("Local News"),
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
              text: 'Local News',
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
          allNews.LocalAllNews(),
          gallery.LocalNewsGallery(),
        ],
      ),
    );
  }
}
