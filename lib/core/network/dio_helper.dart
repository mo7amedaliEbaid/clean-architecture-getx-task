// core/dio_helper.dart

import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioHelper() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add any headers or configurations here
          return handler.next(options);
        },
      ),
    );
  }
}
