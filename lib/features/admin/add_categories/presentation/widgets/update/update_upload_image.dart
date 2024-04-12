
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            showToast(
              context: context,
              text: context.translate(LangKeys.imageUploaded),
              colorText: context.color.textColor!,
              toastState: ToastStates.SUCCECC,
            );
          
          },
          error: (errorMessage) {
            showToast(
              context: context,
              text: errorMessage,
              colorText: context.color.textColor!,
              toastState: ToastStates.ERROR,
            );
           
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
            return InkWell(
              onTap: cubit.uploadImage,
              child: Stack(
                children: [
                  // old image url and new
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          cubit.getImageUrl.isEmpty
                              ? imageUrl
                              : cubit.getImageUrl,
                        ),
                      ),
                    ),
                  ),
                  //Image selected

                  if (cubit.getImageUrl.isEmpty)
                    Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
