import 'package:dio/dio.dart';

abstract class ApiAbstract {
  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic> params,
      bool? isJson, 
      bool? isAuthorized});
  Future<Response> put(
      {required String endpoint, required Map<String, dynamic> params,bool? isAuthorized});
  Future<Response> votePost(
      {required String endpoint, required Map<String, dynamic> params,bool? isAuthorized});
  Future<Response> get({
    required String endpoint,
    required Map<String, dynamic> params,
    bool? isAuthorized
  });
  Future<Response> delete(
      {required String endpoint,
      required Map<String, dynamic> params,
      String? cookies,bool? isAuthorized});
}
