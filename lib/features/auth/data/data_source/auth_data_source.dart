import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/auth/auth_queries.dart';
import 'package:our_clothes_store/core/utils/app_strings.dart';
import 'package:our_clothes_store/features/auth/data/models/login_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/login_response.dart';
import 'package:our_clothes_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:our_clothes_store/features/auth/data/models/sign_up_response.dart';
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

   //SignUp
  Future<SignUpResponse> signUp({required SignUpRequestBody body}) async {
    final response =
        await _apiService.signUp(AuthQueries().signUpMapQuery(body: body));
    return response;
  }
 // add user id in firebase to used with notfication data base
  Future<void> addUserIdFirebase({required String userId}) async {
    await FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(userId)
        .set({});
  }
}
