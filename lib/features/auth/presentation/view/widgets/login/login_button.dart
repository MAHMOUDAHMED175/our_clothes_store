import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/animations/animate_do.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/common/widgets/custom_linear_button.dart';
import 'package:our_clothes_store/core/common/widgets/text_app.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:our_clothes_store/core/routes/app_routes.dart';
import 'package:our_clothes_store/core/style/fonts/font_weight_helper.dart';
import 'package:our_clothes_store/features/auth/presentation/view_model/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userRole) {
              showToast(
                context: context,
                text: context.translate(LangKeys.loggedError),
                colorText: context.color.textColor!,
                toastState: ToastStates.ERROR,
              );
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
              } else {
                context.pushNamedAndRemoveUntil(AppRoutes.mainCustomer);
              }
            },
            error: (messsage) {
             showToast(
                context: context,
                text: context.translate(LangKeys.loggedError),
                colorText: context.color.textColor!,
                toastState: ToastStates.ERROR,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                onPressed: () {},
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                onPressed: () {
                  _validateThenDoLogin(context);
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
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
