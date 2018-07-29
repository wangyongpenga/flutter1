

import 'dart:async';
import 'package:flutter_refresh/model/news_model.dart';


abstract class NewsRepository{
  Future<List<NewsModel>> fetch(int pageNum,int pageSize);
}
