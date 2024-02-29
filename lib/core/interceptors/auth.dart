import 'package:dio/dio.dart';




///Header management interceptor
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: add header to each request {
    //  options.headers["Authorization"] = " $value"
    //  }
    options.headers["Accept"] = "application/json";
    super.onRequest(options, handler);
  }
}
