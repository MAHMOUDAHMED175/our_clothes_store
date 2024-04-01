import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/animations/animate_do.dart';
import 'package:our_clothes_store/core/common/widgets/custom_linear_button.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        onPressed: () {
        },
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child: TextApp(
          text: context.translate(LangKeys.signUp),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
    );
  }

}
