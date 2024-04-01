import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/animations/animate_do.dart';
import 'package:our_clothes_store/core/common/widgets/custom_text_field.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;

//   late AuthBloc _bloc;

//   @override
//   void initState() {
//     super.initState();
//     _bloc = context.read<AuthBloc>();
//   }

//   @override
//   void dispose() {
//     _bloc.emailController.dispose();
//     _bloc.passwordController.dispose();
//     super.dispose();
//   }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _bloc.formKey,
      child: Column(
        children: [
          //Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: emailController,
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                //   return context.translate(LangKeys.validEmail);
                // }
                // return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          //Password
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: passwordController,
              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              validator: (value) {
                // if (value == null || value.isEmpty || value.length < 6) {
                //   return context.translate(LangKeys.validPasswrod);
                // }
                // return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
