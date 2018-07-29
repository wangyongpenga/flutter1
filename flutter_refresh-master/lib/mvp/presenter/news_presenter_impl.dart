import 'package:flutter_refresh/mvp/presenter/news_presenter.dart';
import 'package:flutter_refresh/mvp/repository/news_repository_imlp.dart';
import 'package:flutter_refresh/mvp/repository/news_repository.dart';

class NewsPresenterImpl implements NewsPresenter {
  NewsView _view;

  NewsRepository _repository;

  NewsPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  void loadFLData(int pageNum, int pageSize) {
    assert(_view != null);

    _repository.fetch(pageNum,pageSize).then((data) {
      _view.onloadFLSuc(data);
    }).catchError((error) {
      print(error);
      _view.onloadFLFail();
    });
  }

  @override
  init() {
    _repository = new NewsRepositoryImlp();
  }
}
