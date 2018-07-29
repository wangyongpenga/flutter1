import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/progreess_dialog.dart';
import 'package:flutter_refresh/model/news_model.dart';
import 'package:flutter_refresh/mvp/presenter/news_presenter.dart';
import 'package:flutter_refresh/mvp/presenter/news_presenter_impl.dart';
import 'package:flutter_refresh/widget/common_divider.dart';
import 'package:flutter_refresh/common/constant.dart';
import 'package:flutter_refresh/Utils/route_util.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
new GlobalKey<RefreshIndicatorState>();

class NewsListAppPage extends StatefulWidget {
  NewsListAppPage({Key key}) : super(key: key);

  @override
  _NewsListAppPageState createState() {
    _NewsListAppPageState view = new _NewsListAppPageState();
    NewsPresenter presenter = new NewsPresenterImpl(view);
    presenter.init();
    return view;
  }
}

class _NewsListAppPageState extends State<NewsListAppPage> implements NewsView {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController;

  List<NewsModel> datas = [];

  NewsPresenter _flPresenter;

  int curPageNum = 2;

  bool isSlideUp = false;

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
    _scrollController = new ScrollController()
      ..addListener(_scrollListener);
    print("");
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  Future<Null> _refreshData() {
    isSlideUp = false;

    final Completer<Null> completer = new Completer<Null>();

    curPageNum = 2;

    _flPresenter.loadFLData(curPageNum, 10);

    setState(() {});

    completer.complete(null);

    return completer.future;
  }

  Future<Null> _loadData() {
    isSlideUp = true;

    final Completer<Null> completer = new Completer<Null>();

    curPageNum = curPageNum + 1;

    _flPresenter.loadFLData(curPageNum, 10);

    setState(() {});

    completer.complete(null);

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    var content;

    if (datas.isEmpty) {
      content = getProgressDialog();
    } else {
      content = new ListView.builder(
        //设置physics属性总是可滚动
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: datas.length,
        itemBuilder: buildCard,
      );
    }

    var _refreshIndicator = new RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refreshData,
      child: content,
    );

    return _refreshIndicator;
  }


  Widget buildCard(BuildContext context, int index) {
    String item = "";
    if (datas[index].images != null) {
      item = datas[index].images[0];
    }else{
      item="http://m.china.com.cn/images/app/appicon.png";
    }
    return new InkWell(
        onTap: () {
          //RouteUtil.route2Detail(context, '$index', '$item');
          RouteUtil.route2Web(context, datas[index].title, datas[index].artUrl);

        },
        child: new Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 12.0),
            child: new SizedBox(
              height: Constant.normalItemHeight,
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text(
                          datas[index].title,
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new SizedBox(
                          height: 80.0,
                          width: 100.0,
                          child: new Image.network(item, width: 80.0,
                            height: 70.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                  new Expanded(
                    child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: CommonDivider.buildDivider(),
                    ),
                  ),
                ],
              ),
            )));
  }


  @override
  void onloadFLFail() {
    // TODO: implement onloadFLFail
  }

  @override
  void onloadFLSuc(List<NewsModel> list) {
    if (!mounted) return; //异步处理，防止报错
    setState(() {
      if (isSlideUp) {
        datas.addAll(list);
      } else {
        datas = list;
      }
    });
  }

  @override
  setPresenter(NewsPresenter presenter) {
    // TODO: implement setPresenter
    _flPresenter = presenter;
  }
}

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new NewsListAppPage(),
    );
  }
}
