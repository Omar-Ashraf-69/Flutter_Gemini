import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Future<Map<String, dynamic>> get({required String endpoint}) async {
  //   Response response = await _dio.get("$endpoint");
  //   return response.data;
  // }

  Future<Map<String, dynamic>> get(
      {required String url,
      Map<String, String>? headers,
      @required String? token}) async {
    // _dio.options.headers['Authorization'] = 'Bearer ${token ?? ""}';
    Response response = await _dio.get(
      url,
      options: Options(
        // contentType: 'application/x-www-form-urlencoded',
        headers: headers ?? {'Authorization': 'Bearer ${token ?? ""}'},
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String url,
      @required dynamic body,
      Map<String, String>? headers,
      @required String? token}) async {
    Response response = await _dio.post(
      url,
      data: body,
      options: Options(
        // contentType: 'application/x-www-form-urlencoded',
        headers: headers ?? {'Authorization': 'Bearer ${token ?? ""}'},
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    _dio.options.headers['Authorization'] = 'Bearer ${token ?? ""}';
    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    log('url = $url body = $body token = $token ');

    Response response = await _dio.put(
      url,
      data: body,
      options: Options(headers: _dio.options.headers),
    );
    return response.data;
  }
}
