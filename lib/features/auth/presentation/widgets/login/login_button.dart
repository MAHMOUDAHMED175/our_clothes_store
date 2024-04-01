import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/widgets/custom_linear_button.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {
        // _validateThenDoLogin(context);
        context.pushName(AppRoutes.signUp);
      },
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: TextApp(
        text: context.translate(LangKeys.login),
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    );
    // return CustomFadeInRight(
    //   duration: 600,
    //   child: BlocConsumer<AuthBloc, AuthState>(
    //     listener: (context, state) {
    //       // state.whenOrNull(
    //       //   success: (userRole) {
    //       //     ShowToast.showToastSuccessTop(
    //       //       message: context.translate(LangKeys.loggedSuccessfully),
    //       //     );
    //       //     if (userRole == 'admin') {
    //       //       context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
    //       //     } else {
    //       //       context.pushNamedAndRemoveUntil(AppRoutes.mainCustomer);
    //       //     }
    //       //   },
    //       //   error: (messsage) {
    //       //     ShowToast.showToastErrorTop(
    //       //       message: context.translate(messsage),
    //       //     );
    //       //   },
    //       // );
    //     },
    //     builder: (context, state) {
    //       return state.maybeWhen(
    //         loading: () {
    //           return CustomLinearButton(
    //             onPressed: () {},
    //             height: 50.h,
    //             width: MediaQuery.of(context).size.width,
    //             child: const CircularProgressIndicator(
    //               color: Colors.white,
    //             ),
    //           );
    //         },
    //         orElse: () {
    //           return CustomLinearButton(
    //             onPressed: () {
    //               // _validateThenDoLogin(context);
    //             },
    //             height: 50.h,
    //             width: MediaQuery.of(context).size.width,
    //             child: TextApp(
    //               text: context.translate(LangKeys.login),
    //               theme: context.textStyle.copyWith(
    //                 fontSize: 18.sp,
    //                 fontWeight: FontWeightHelper.bold,
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );
  }

  // void _validateThenDoLogin(BuildContext context) {
  //   if (context.read<AuthBloc>().formKey.currentState!.validate()) {
  //     context.read<AuthBloc>().add(const AuthEvent.login());
  //   }
  // }
}
