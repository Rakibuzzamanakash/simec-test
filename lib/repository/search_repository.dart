


import 'package:semic/model/TestDataModel.dart';

import '../data/network/network_api_service.dart';
import '../resources/app_url/app_url.dart';

class SearchRepository {

  final _apiService = NetworkApiServices();

  Future<TestDataModel> testDataApi(String key) async{
    dynamic response = await _apiService.getApi(AppUrl.searchUrl+key);
    return TestDataModel.fromJson(response);
  }

}