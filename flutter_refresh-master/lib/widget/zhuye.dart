import 'dart:async' show Future, Timer;

import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/Refresh.dart';
import 'package:english_words/english_words.dart';

class ZhuYePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body: new MyHomePage(),
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
  int _counter = 20;

  Future<Null> getData() {
    setState(() {
      _counter += 10;
      if (_counter > 40) {
        isnomore = true;
      }
    });
    return Future.delayed(Duration(milliseconds: 500), () {

    });
  }

  Future<Null> reset() {
    setState(() {
      list.clear();
      _counter = 20;
      isnomore = false;
    });
    return Future.delayed(Duration(milliseconds: 500), () {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: RefreshLayout(canloading: !isnomore, onRefresh: (boo) {
                  if (!boo) {
                    return getData();
                  } else {
                    return reset();
                  }
                }, key: key,
                    child: new ListView(children: _listBuilder(_counter),)))
            ,
          ],
        ),
      ),
    );
  }

  bool isnomore = false;

  final List<String> list = [];


  List<Widget> _listBuilder(int i) {
    final List<Widget> listw = [];
    if (list.isEmpty) {
      for (int i = 0; i < 1000; i++) {
        list.add(WordPair
            .random()
            .asPascalCase);
      }
    }
    for (int count = 0; count < i; count++) {
      listw.add(
        ListTile(leading: Icon(Icons.favorite_border, color: Colors.red,),
            title: Text(list[count]),
            onTap: () {
          //    Navigator.of(context).pop();
              Navigator.pushNamed(context, '/NetworkPage');
            }),);
    }
    listw.add(Padding(padding: EdgeInsets.only(bottom: 16.0),
        child: Center(child: Text(!isnomore ? "" : '我是有底线的'))),);
    return listw;
  }
}



