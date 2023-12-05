import 'dart:convert';
import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/request/request.dart';
// import 'package:mriguel_app/models/error_response.dart';
// import 'package:http/http.dart' as http;

class ServiceProvider extends GetConnect {
  static const mainHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  // Get request
  Future<Response> getData(String url, {Map<String, String>? headers}) =>
      get(url, headers: headers ?? mainHeaders);
  // Post request
  Future<Response> postData(String url, Map data,
          {Map<String, String>? headers}) =>
      post(url, jsonEncode(data), headers: headers ?? mainHeaders);
  // Put request
  Future<Response> putData(String url, Map data,
          {Map<String, String>? headers}) =>
      put(url, jsonEncode(data), headers: headers ?? mainHeaders);
  // Delete request
  Future<Response> deleteData(String url, {Map<String, String>? headers}) =>
      delete(url, headers: headers ?? mainHeaders);
}
