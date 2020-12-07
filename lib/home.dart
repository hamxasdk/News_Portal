import 'package:News_Portal/controller/localNews.dart';
import 'package:News_Portal/controller/politicalNews.dart';
import 'package:News_Portal/controller/sportsNews.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'deatilsLatestPost.dart';
import 'dart:async';
import 'globalVariables.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:News_Portal/controller/internationalNews.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection('LatestPost');
  // CollectionReference collectionReference =
  //     Firestore.instance.collection('LatestPost');
  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: new Text('News Portal')),
        backgroundColor: Colors.white54,
      ),
      // Drawer Start

      drawer: new Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('News Portal App'),
                accountEmail: Text('Hamxasdk'),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text(
                  'International News',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.integration_instructions,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              ListTile(
                title: Text(
                  'Sports News',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.sports_football,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              ListTile(
                title: Text(
                  'Local News',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.local_activity,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              ListTile(
                title: Text(
                  'Politics News',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.panorama,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white24,
      body: ListView(
        children: [
          Container(
            height: 190.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Latest Post',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 130.0,
                  margin: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300.0,
                        margin: EdgeInsets.only(left: 10.0, right: 0),
                        color: Colors.blueGrey.shade900,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: new Image.network(
                                  snapshot[index].data[('image')],
                                  fit: BoxFit.cover,
                                  height: 130,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Moving to Latest Post Details page
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    LatestPostDetails(
                                                        snapshot[index])));
                                      },
                                      child: Text(
                                        snapshot[index].data['title'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      snapshot[index].data['content'],
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.deepOrange,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          'View',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        )
                                      ],
                                    ))
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.length,
                  ),
                )
              ],
            ),
          ),

          // Divider(
          //   color: Colors.white,
          // ),
          SizedBox(
            height: 7.0,
          ),
          // Carousal Slider
          Container(
            height: 200.0,
            margin: EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 600),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                borderRadius: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage(
                      'https://i.dawn.com/large/2020/11/5fc13815b963f.jpg'),
                  NetworkImage(
                      'https://i.dawn.com/primary/2020/11/5fc10946cfdc9.jpg'),
                  NetworkImage(
                      'https://i.dawn.com/thumbnail/2020/11/5fc10155ebe9d.png'),
                  NetworkImage(
                      'https://i.dawn.com/thumbnail/2020/11/5fc0f132ca37a.png'),
                  NetworkImage(
                      'https://i.dawn.com/thumbnail/2020/11/5fc0e542d6e40.jpg'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01,
          ),
          Container(
            height: 80,
            margin: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => InternationalNews()));
                            },
                            child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade900,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  'International News',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SportsNews()));
                          },
                          child: Container(
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade900,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Sports News',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // SizedBox(height: 0.000001),
          Container(
            margin: EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PoliticalNews()));
                    },
                    child: Container(
                      height: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blueGrey.shade900),
                      child: Center(
                          child: Text('Political News',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white))),
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LocalNews()));
                    },
                    child: Container(
                      height: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blueGrey.shade900),
                      child: Center(
                          child: Text('Local News',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
