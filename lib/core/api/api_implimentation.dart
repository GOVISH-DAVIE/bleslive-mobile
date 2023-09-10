import 'package:bleslive/utils/constant.dart';
import 'package:bleslive/utils/theme.dart';
import 'package:dio/dio.dart';
import 'package:bleslive/core/api/api.dart';

class Api implements ApiAbstract{
  final Dio _dio = Dio();
  
  @override
  Future<Response> delete({required String endpoint, required Map<String, dynamic> params, String? cookies, bool? isAuthorized}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<Response> get({required String endpoint, required Map<String, dynamic> params, bool? isAuthorized}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  
  @override
  Future<Response> post({required String endpoint, required Map<String, dynamic> params, bool? isJson, bool? isAuthorized}) {
    logger.i('$baseUrl$endpoint');
    logger.i(params);
   return  _dio.post('$baseUrl$endpoint', data: params);
  }
  
  @override
  Future<Response> put({required String endpoint, required Map<String, dynamic> params, bool? isAuthorized}) {
    // TODO: implement put
    throw UnimplementedError();
  }
  
  @override
  Future<Response> votePost({required String endpoint, required Map<String, dynamic> params, bool? isAuthorized}) {
    // TODO: implement votePost
    throw UnimplementedError();
  }
}