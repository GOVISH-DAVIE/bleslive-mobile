// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:bleslive/models/user/user.dart';
import 'package:bleslive/utils/constants.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApiAbstract {
  User? user;
  void refeshAuth();
  Future<Response> getHTTP(
      {required String endpoint, Map<String, dynamic>? params});
  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic> params,
      bool? isJson});
  Future<Response> put(
      {required String endpoint, required Map<String, dynamic> params});
  Future<Response> votePost(
      {required String endpoint, required Map<String, dynamic> params});
  Future<Response> get({
    required String endpoint,
    required Map<String, dynamic> params,
  });
  Future<Response> delete(
      {required String endpoint,
      required Map<String, dynamic> params,
      String? cookies});
  // Future<Response> delete({required String endpoint});
  Future<Response> postCookies(
      {required String endpoint,
      required Map<String, dynamic> params,
      required dynamic cookieHeader});

  Future<Response> deleteMessage(
      {required String endpoint,
      required Map<String, dynamic> params,
      String? cookies});
}

class Api implements ApiAbstract {
  @override
  User? user;
  final Dio _dio = Dio();

  API() {}

  @override
  Future<Response> getHTTP(
      {required String endpoint, Map<String, dynamic>? params}) async {
    logger.i("'$baseUrl$endpoint'");
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    // CookieJar cookieJar = CookieJar();
    // _dio.interceptors.add(CookieManager(cookieJar));
    return _dio.get('$baseUrl$endpoint',
        queryParameters: params,
        options: Options(headers: <String, String>{
          'authorization':  'Bearer ${user!.access}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic> params,
      bool? isJson}) async {
    logger.i('$baseUrl$endpoint');
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    // CookieJar cookieJar = CookieJar();
    // _dio.interceptors.add(CookieManager(cookieJar));
    return _dio.post('$baseUrl$endpoint',
        data: isJson == null
            ? FormData.fromMap(params)
            : isJson == false
                ? FormData.fromMap(params)
                : json.encode(params),
        options: Options(headers: <String, String>{
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> postCookies(
      {required String endpoint,
      required Map<String, dynamic> params,
      required dynamic cookieHeader}) {
    // TODO: implement postCookies

    return _dio.post('$baseUrl$endpoint',
        data: FormData.fromMap(params),
        options: Options(headers: {
          'cookie': cookieHeader,
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  // Future<Response> delete({required String endpoint}) {
  //   // TODO: implement delete
  //   // CookieJar cookieJar = CookieJar(ignoreExpires: true);
  //   // _dio.interceptors.add(CookieManager(cookieJar));
  //   return _dio.get('$baseUrl$endpoint',
  //       options: Options(headers: <String, String>{
  //         'authorization':
  //             'Basic ${base64.encode(utf8.encode('${user?.username}:${user?.password}'))}',
  //         'OCS-APIRequest': 'true',
  //         'accept': 'application/json'
  //       }));
  // }

  @override
  void refeshAuth() async {
    // TODO: implement refeshAuth
    final prefs = await SharedPreferences.getInstance();
    user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    logger.i("--refresh token =$user");
  }

  //**
  // Module : Voting
  // */

  @override
  Future<Response> votePost(
      {required String endpoint, required Map<String, dynamic> params}) async {
    logger.i('$baseUrl$endpoint');
    return _dio.post('$baseUrl$endpoint',
        data: json.encode(params),
        options: Options(headers: <String, String>{
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> put(
      {required String endpoint, required Map<String, dynamic> params}) async {
    logger.i('$baseUrl$endpoint');
    return _dio.put('$baseUrl$endpoint',
        data: json.encode(params),
        options: Options(headers: <String, String>{
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> get(
      {required String endpoint, Map<String, dynamic>? params}) async {
    logger.i("'$baseUrl$endpoint'");
    return _dio.get('$baseUrl$endpoint',
        queryParameters: params,
        options: Options(headers: <String, String>{
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  @override
  Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? params,
      String? cookies}) async {
    logger.i("'$baseUrl$endpoint'");
    return _dio.delete('$baseUrl$endpoint',
        queryParameters: params,
        options: Options(headers: <String, String>{
          'cookie': "$cookies",
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }

  // **/

  /**
   * File Upload
   */
  Future putFile({
    required String endpoint,
    // required String file,
    Map<String, dynamic>? data,
  }) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));
    String basicAuth =
        'Bearer ${user.access}';

    // final formData = FormData.fromMap({
    //   'file': await MultipartFile.fromFile(file),
    // });
    return _dio.put('$serverFilesUrl$endpoint',
        data: FormData.fromMap(data!),
        // data: formData,
        options: Options(headers: <String, String>{
          'authorization': basicAuth,
          'OCS-APIRequest': 'true',
          'accept': 'application/json',
          'contentType': 'multipart/form-data',
        }));
  }

  Future postDatav2({
    required String endpoint,
    required Map<String, dynamic> param,
  }) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString('creds')!));

     String basicAuth =
        'Bearer ${user.access}';
        
      return _dio.post('$baseOcsUrl$endpoint',
        data: FormData.fromMap(param),
        options: Options(headers: <String, String>{
          'authorization': basicAuth,
          'OCS-APIRequest': 'true',
          'accept': 'application/json',
          'contentType': 'multipart/form-data',
        }));
  }

  @override
  Future<Response> deleteMessage(
      {required String endpoint,
      Map<String, dynamic>? params,
      String? cookies}) async {
    logger.i("'$baseOcsUrl$endpoint'");
    return _dio.delete('$baseUrl$endpoint',
        queryParameters: params,
        options: Options(headers: <String, String>{
          'cookie': "$cookies",
          'authorization':
              'Basic ${user!.access!}',
          'OCS-APIRequest': 'true',
          'accept': 'application/json'
        }));
  }
}
