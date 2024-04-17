import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  LoginRequestBody({required this.password, required this.email});

  final String password;
  final String email;
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
