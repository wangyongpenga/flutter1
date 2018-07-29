import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_refresh/widget/progreess_dialog.dart';
import 'package:flutter_refresh/model/fl_model.dart';
import 'package:flutter_refresh/mvp/presenter/fl_presenter.dart';
import 'package:flutter_refresh/mvp/presenter/fl_presenter_impl.dart';
import 'package:flutter_refresh/widget/common_divider.dart';
import 'package:flutter_refresh/common/constant.dart';
import 'package:flutter_refresh/Utils/route_util.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
new GlobalKey<RefreshIndicatorState>();

class ZhuYeAppPage extends StatefulWidget {
  ZhuYeAppPage({Key key}) : super(key: key);

  @override
  _ZhuYeAppPageState createState() {
    _ZhuYeAppPageState view = new _ZhuYeAppPageState();
    FLPresenter presenter = new FLPresenterImpl(view);
    presenter.init();
    return view;
  }
}

class _ZhuYeAppPageState extends State<ZhuYeAppPage> implements FLView {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController;

  List<FLModel> datas = [];

  FLPresenter _flPresenter;

  int curPageNum = 1;

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
    print("girl");
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  Future<Null> _refreshData() {
    isSlideUp = false;

    final Completer<Null> completer = new Completer<Null>();

    curPageNum = 1;

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
    final String item = datas[index].url;
    return new InkWell(
        onTap: () {
          RouteUtil.route2Detail(context, '$index', '$item');
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
                          "我是列表数据  $index,网络同步图片如右图",
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new SizedBox(
                          height: 80.0,
                          width: 80.0,
                          child: new Image.network(item),
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
  void onloadFLSuc(List<FLModel> list) {
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
  setPresenter(FLPresenter presenter) {
    // TODO: implement setPresenter
    _flPresenter = presenter;
  }
}

class TabGirlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ZhuYeAppPage(),
    );
  }
}
