
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/animations/animate_do.dart';
import 'package:our_clothes_store/core/common/widgets/custom_linear_button.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
           CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: (){},
                child: const Icon(
                  Icons.light_mode_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          
        //Language Button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              // if (AppLocalizations.of(context)!.isEnLocale) {
              //   cubit.toArabic();
              // } else {
              //   cubit.toEnglish();
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
        ),
      ],
    );
  }
}
