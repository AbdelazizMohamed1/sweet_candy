import 'package:dio/dio.dart';

import '../api/api_const.dart';


class DioHelper{

  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseurl,
        sendTimeout: Duration(seconds: 20),
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        responseType: ResponseType.json,

        validateStatus: (status) {
          if(status == null){

            return false;
          }
          if(status == 401){

            return true;
          }else{
            return status >= 200 ;
          }
        },
      ),

    );



  }


  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async{
    dio!.options.headers = {
      "Authorization": 'Bearer ${token ?? ""}',
      'Accept': "application/json",
    };
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    required Map<String, dynamic> data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };

    return await dio!.post(
      path,
      queryParameters: query,
      data: data,
      // options: Options(
      //   responseType: ResponseType.json,
      //   validateStatus: (status) {
      //     if(status == null){
      //       return false;
      //     }
      //     if(status == 401){ // your http status code
      //       return true;
      //     }else{
      //       return status >= 200 ;
      //     }
      //   },
      // )
    );
  }

  static Future<Response> putData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.put(
      path,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> patchData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.patch(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async{
    dio!.options.headers = {
      'Authorization': 'Bearer ${token??''}',
    };
    return await dio!.delete(
      path,
      queryParameters: query,
      data: data,
    );
  }
}