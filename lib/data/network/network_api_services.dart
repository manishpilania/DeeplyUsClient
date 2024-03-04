import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:deeply_us_project/data/app_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:deeply_us_project/data/network/base_api_services.dart';



abstract class NetworkApiService implements BaseApiServices {

  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson ;
    try {

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    }on SocketException {
      throw NoInternetException('');
    }on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;

  }


  @override
  Future getPostApiResponse(String url , dynamic data) async{


    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson ;
    try {

      Response response = await post(
          Uri.parse(url),
          body: data
      ).timeout( const Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException {
      throw NoInternetException('No Internet Connection');
    }on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson ;
  }

  dynamic returnResponse (http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }

}