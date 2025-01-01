import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../local/shared_preference.dart';



class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization": '${CacheHelper.getData(key: "token")}',
        }));

    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(endPoint, queryParameters: queryParameters);
  }

  static Future<Response> postData(
      {required String endPoint, required dynamic data}) async {
    return await dio!.post(endPoint, data: data);
  }
  static Future<Response> deleteData(
      {required String endPoint}) async {
    return await dio!.delete(endPoint);
  }

  static Future<Response> putData(
      {required String endPoint, required dynamic data}) async {
    return await dio!.put(endPoint, data: data);
  }
}
