import 'package:restful_api_practice/provider/data_provider.dart';

import '../models/data_model.dart';

class DataService {
  final _api = DataApi();
  Future<List<Data>?> getAllData() async {
    return _api.getAllData();
  }
}
