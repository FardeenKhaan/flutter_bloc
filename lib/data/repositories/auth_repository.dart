import 'package:dio/dio.dart';
import 'package:flutter_bloc_practice/data/services/api_services.dart';

class AuthRepository {
  final _apiservices = ApiServices();

  /// Function to login the user
  Future<Response> loginUser(String username, String password) async {
    try {
      Response response = await _apiservices.postApi('https://dummyjson.com/auth/login', {
        'username': username,
        'password': password,
      });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
