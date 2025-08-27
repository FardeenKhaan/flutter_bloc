import 'package:dio/dio.dart';

class ApiServices {
  final _dio = Dio();

  Future<Response> getApi(String url) async {
    try {
      Response response = await _dio.get(url, options: Options());
      print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postApi(String url, dynamic data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
