import 'dart:async' show Future, Timer;

import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/Refresh.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_refresh/widget/zhuye.dart';
import 'package:flutter_refresh/widget/network_page.dart';


void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new MyHomePage(title: 'Flutter探索'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Key key = GlobalKey();


  _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new ZhuYePage(),
        new ZhuYePage(),
        new ZhuYePage(),
        new NetworkAppPage(),
      ],
      index: _curIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  _body,
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("主页")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.phone_android), title: new Text("Android")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.phone_iphone), title: new Text("iOS")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("我的")),
        ],
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }

  bool isnomore = false;
  var _body;

  final List<String> list = [];
  var _curIndex = 0;
}



