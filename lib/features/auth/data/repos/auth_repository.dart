import 'package:our_clothes_store/core/services/graphql/api_result.dart';
import 'package:our_clothes_store/core/utils/app_strings.dart';
import 'package:our_clothes_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:our_clothes_store/features/auth/data/models/login_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/login_response.dart';

class AuthRepository {
  const AuthRepository(this._authDataSource);

  final AuthDataSource _authDataSource;

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _authDataSource.loginDataSource(
        loginRequestBody: loginRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
