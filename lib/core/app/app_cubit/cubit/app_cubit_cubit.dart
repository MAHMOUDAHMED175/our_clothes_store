import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_clothes_store/core/services/shared_pref/pref_keys.dart';
import 'package:our_clothes_store/core/services/shared_pref/shared_pref.dart';

part 'app_cubit_state.dart';
part 'app_cubit_cubit.freezed.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(const AppCubitState.initial());




    bool isDark = true;


//Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppCubitState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppCubitState.themeChangeMode(isDark: isDark));
      });
    }
  }
}
