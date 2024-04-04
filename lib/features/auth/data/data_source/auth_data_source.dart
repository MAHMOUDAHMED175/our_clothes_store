import 'package:dio/dio.dart';
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/auth/auth_queries.dart';
import 'package:our_clothes_store/features/auth/data/models/login_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/login_response.dart';
import 'package:our_clothes_store/features/auth/data/models/user_role_response.dart';

class AuthDataSource {
  const AuthDataSource(this._apiService);
  final ApiService _apiService;

  Future<LoginResponse> loginDataSource({
    required LoginRequestBody loginRequestBody,
  }) async {
    final result = await _apiService.login(
      AuthQueries().loginMapQuery(
        body: loginRequestBody,
      ),
    );
    return result;
  }

  Future<UserRoleResponse> userRole({
    required String token,
  }) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final result = await client.userRole();
    return result;
  }
}
