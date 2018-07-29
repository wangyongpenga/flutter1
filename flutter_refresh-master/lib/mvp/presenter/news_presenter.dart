import 'package:flutter_refresh/model/news_model.dart';
import 'package:flutter_refresh/mvp/mvp.dart';


abstract class NewsPresenter implements IPresenter{
  loadFLData(int pageNum,int pageSize);
}


abstract class NewsView implements IView<NewsPresenter>{
  void onloadFLSuc(List<NewsModel> list);
  void onloadFLFail();
}
