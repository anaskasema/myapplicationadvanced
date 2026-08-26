import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(endpoint, queryParameters: queryParameters);

    return response;
  }

  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }
}
