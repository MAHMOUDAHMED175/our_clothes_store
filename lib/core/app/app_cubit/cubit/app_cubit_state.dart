part of 'app_cubit_cubit.dart';

@freezed
class AppCubitState with _$AppCubitState {
  const factory AppCubitState.initial() = _Initial;
  const factory AppCubitState.themeChangeMode({required bool isDark}) =
      themeChangeMode;
}
// dart run build_runner build --delete--conflicting-outputs
