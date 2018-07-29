import 'dart:async';
import 'package:flutter_refresh/model/news_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_refresh/common/constant.dart';
import 'package:flutter_refresh/mvp/repository/news_repository.dart';

class NewsRepositoryImlp implements NewsRepository {
  @override
  Future<List<NewsModel>> fetch(int pageNum, int pageSize) {
    return _getData(pageNum, pageSize);
  }
}

Future<List<NewsModel>> _getData(int pageNum, int pageSize) async {
  var httpClient = new HttpClient();
  var url = Constant.mainUrl+"page=$pageNum&size=10";

  print(url);

  List NewsModels;
  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();

    if (response.statusCode == HttpStatus.OK) {
      var json = await response.transform(UTF8.decoder).join();
      NewsModels = jsonDecode(json)['list'];
    } else {
      //todo
    }
  } catch (exception) {
    //todo
  }

  return NewsModels.map((model) {
    return new NewsModel.fromJson(model);
  }).toList();
}



