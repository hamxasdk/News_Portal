import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class LatestPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;
  LatestPostDetails(this.snapshot);
  @override
  _LatestPostDetailsState createState() => _LatestPostDetailsState();
}

class _LatestPostDetailsState extends State<LatestPostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Post Details'),
        backgroundColor: Colors.white54,
      ),
      backgroundColor: Colors.white24,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                widget.snapshot.data['image'],
                height: 250.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            color: Colors.blueGrey.shade900,
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Text(
                          widget.snapshot.data['title'][0],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Text(
                            widget.snapshot.data['title'],
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.snapshot.data['content'],
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
