

import 'dart:async';
import 'package:flutter_refresh/model/fl_model.dart';


abstract class FLRepository{
  Future<List<FLModel>> fetch(int pageNum,int pageSize);
}
