import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DetailAppPage extends StatefulWidget {

  final String id;
  final String url;

  DetailAppPage(this.id, this.url, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DetailAppPageState();
  }
}

class _DetailAppPageState extends State<DetailAppPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('内容详情(' + widget.id + ")"),
        centerTitle: true,
      ),
      body: (
          new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Card(
                    child: new Image.network(widget.url),
                  ),
                ),
                new Container(
                padding: const EdgeInsets.only(left: 10.0,right:8.0),
                  child: new Text(
                    '这里是内容详情页' + widget.id,
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),),
              ],
            ),
          )

      ),
    );
  }
}


