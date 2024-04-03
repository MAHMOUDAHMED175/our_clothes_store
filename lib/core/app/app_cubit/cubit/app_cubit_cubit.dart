import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:our_clothes_store/core/services/shared_pref/pref_keys.dart';
import 'package:our_clothes_store/core/services/shared_pref/shared_pref.dart';

part 'app_cubit_state.dart';
part 'app_cubit_cubit.freezed.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(const AppCubitState.initial());

  bool isDark = true;
  String currentLangCode = 'en';

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

  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';
    currentLangCode = result!;
    emit(AppCubitState.languageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLanguage(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppCubitState.languageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLanguage('ar');
  void toEnglish() => _changeLanguage('en');
}
