import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../enums/enums.dart';
import '../helpers/dio_helper.dart';
import 'status.dart';
import '../log/log.dart';

import 'exceptions.dart';

class NetworkCall {
  DioHelper dioHelper;

  NetworkCall({required this.dioHelper});

  Future<Response> _request<T>(String url,
      {dynamic data,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
        Map<String, dynamic>? headers,
        void Function(int, int)? onSendProgress}) async {
     if (headers != null) {
    options.headers?.addAll(dioHelper.dio.options.headers);
     dioHelper.dio.options.headers = headers;
    }
    return await dioHelper.dio.request(url,
        onSendProgress: onSendProgress,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }

  Future<Map<String, dynamic>> request(
      String url, {
        dynamic params,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
      }) async {
    return await _handleException(_request(
      url,
      data: params == null && options.method == Method.post.name
          ? {"a": "a"}
          : params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }

  Stream<Map<String, dynamic>> requestStream<Response>(
      Method method,
      String url, {
        Function(int code, String msg)? onError,
        Map<String, dynamic>? params,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        required Options options,
        Map<String, dynamic>? headers,
      }) {
    return Stream.fromFuture(_handleException(_request(url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        headers: headers)));
  }

  Future<Map<String, dynamic>> _handleException(
      Future<Response<dynamic>> function) async {
    try {
      final response = await function;
      late final Map<String, dynamic> result;
      print('amr');
      print(response.data);
      if (response.data is String) {
        result = jsonDecode(response.data);
      } else {
        result = response.data;
      }

      Log.i(response.realUri.toString());
      Log.i(result.toString());
      // if (!result.containsKey('status')) {
      //   return result;
      // }

      if (result['success'] == true /*|| result['status'] == 201*/) {
        return result;
      } else if (result['error'] == "Unauthenticated.") {
        throw UnAuthorizedException();
      }

      if (result['status'] == ErrorStatus.unAuthorized) {
        throw UnAuthorizedException();
      } else if (result['status'] == ErrorStatus.forbidden) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (result['message'] is List) {
          errorMessage = result['message'].first;
        } else {
          errorMessage = result['message'];
        }

        throw ServerException(message: errorMessage);
      }
    } on DioError catch (dioError) {
      if (dioError.error is SocketException) {
        throw const SocketException('no connect');
      }

      final responseBody = dioError.response!.data;
      final response = dioError.response!;
      Log.e(response.requestOptions.uri.toString());
      Log.i(response.toString());
      Log.i(StackTrace.current.toString());

      if (response.statusCode == ErrorStatus.unAuthorized) {
        throw UnAuthorizedException();
      } else if (response.statusCode == ErrorStatus.forbidden) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (responseBody['message'] is List) {
          errorMessage = responseBody['message'].first;
        } else {
          errorMessage = responseBody['message'];
        }

        throw ServerException(message: errorMessage);
      }
    } catch (error) {
      rethrow;
    }
  }
}