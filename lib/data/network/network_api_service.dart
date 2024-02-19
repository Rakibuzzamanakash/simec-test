import 'dart:convert';
import 'dart:io';




import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:semic/data/network/base_api_service.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {




  @override
  Future<dynamic> getApi(String url,{dynamic header}) async{
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson ;

    try{
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }

    if (kDebugMode) {
      print(responseJson);
    }

    return responseJson ;
  }



  @override
  Future<dynamic> postApi(String url,dynamic data,{dynamic header}) async{
    // if (kDebugMode) {
    //   print(url);
    //   print(data);
    // }

    dynamic responseJson ;
    try{

      final response = await http.post(Uri.parse(url),
        body: data,
        headers: header,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');
    }

    // if (kDebugMode) {
    //   print(responseJson);
    // }

    return responseJson;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 405:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error accorded while communication with server ${response.statusCode}');
    }
  }


}