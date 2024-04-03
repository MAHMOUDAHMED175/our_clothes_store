import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/auth/auth_queries.dart';
import 'package:our_clothes_store/features/auth/data/models/login_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/login_response.dart';

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
}
