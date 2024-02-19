import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:semic/model/TestDataModel.dart';
import 'package:semic/repository/search_repository.dart';

import '../data/response/status.dart';



class TestDataController extends GetxController {
  final _api = SearchRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final searchDataList = TestDataModel().obs;
  RxString error = ''.obs;

  TextEditingController searchController = TextEditingController();


  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setTestDataSearchList(TestDataModel value) => searchDataList.value = value;
  void setError(String value) => error.value = value;



@override
  void onInit() {
   print(searchDataList);
    super.onInit();
  }

  void testDataSearchApi(String key) {
    setRxRequestStatus(Status.LOADING);

    _api.testDataApi(key).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setTestDataSearchList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }


}

