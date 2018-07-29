import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/constant.dart';
import 'package:flutter_refresh/model/ai_model.dart';
import 'package:flutter_refresh/model/hot_news_model.dart';
import 'package:http/http.dart' as http;

class TodoAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TodoAppPageState();
  }
}

class _TodoAppPageState extends State<TodoAppPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Hello World ！Todo …… '),
      ),
    );
  }
}
