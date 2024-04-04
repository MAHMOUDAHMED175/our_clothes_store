import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/animations/animate_do.dart';
import 'package:our_clothes_store/core/app/app_cubit/cubit/app_cubit_cubit.dart';
import 'package:our_clothes_store/core/common/widgets/custom_linear_button.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/app_localizations.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubitCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),

        //Language Button
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInLeft(
              duration: 400,
              child: CustomLinearButton(
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    cubit.toArabic();
                  } else {
                    cubit.toEnglish();
                  }

                  // if(context.translate(LangKeys.language)=='English') {
                  // cubit.toEnglish();
                  // }else{
                  // cubit.toArabic();
                  // }
                  
                },
                height: 44.h,
                width: 100.w,
                child: TextApp(
                  text: context.translate(LangKeys.language),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
