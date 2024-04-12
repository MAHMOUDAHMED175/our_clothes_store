import 'package:our_clothes_store/core/services/graphql/api_result.dart';
import 'package:our_clothes_store/core/utils/app_strings.dart';
import 'package:our_clothes_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:our_clothes_store/features/auth/data/models/login_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/login_response.dart';
import 'package:our_clothes_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/sign_up_response.dart';
import 'package:our_clothes_store/features/auth/data/models/user_role_response.dart';

abstract class AuthRepositoryAbstr {
  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  );

  Future<UserRoleResponse> userRole(
    String token,
  );
}

class AuthRepository extends AuthRepositoryAbstr {
  AuthRepository(this._authDataSource);

  final AuthDataSource _authDataSource;

  @override
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

  @override
  Future<UserRoleResponse> userRole(
    String token,
  ) async {
    final result = await _authDataSource.userRole(token: token);
    return result;
  }



   //SignUp
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _authDataSource.signUp(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure('Please, try agian we have error');
    }
  }
}
