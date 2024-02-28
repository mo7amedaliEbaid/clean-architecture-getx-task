import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';


import '../interceptors/auth.dart';
import '../network/base_url.dart';


class DioHelper {
  late Dio _dio;

  DioHelper() {
    createDio();
  }

  Dio get dio => _dio;

  void createDio() {
    _dio = Dio(createNewBaseOptions());
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LoggingInterceptor());
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static BaseOptions createNewBaseOptions(
      {baseUrl = ServicesURLs.developmentEnvironment,
      }) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.plain,
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
       // 'lang': instance<HiveHelper>().getLang()
      },
      validateStatus: (status) {
        return true;
      },
    );
  }
}