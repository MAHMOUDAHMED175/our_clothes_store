import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
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
            return state.maybeWhen(
              loadingList: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 90.h,
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
                }
                return SeletetYourProductImage(
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return SeletetYourProductImage(
                  index: index,
                  onTap: () {
                    context
                        .read<UploadImageCubit>()
                        .uploadImageList(indexId: index);
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class SeletetYourProductImage extends StatelessWidget {
  const SeletetYourProductImage({
    required this.index,
    required this.onTap,
    super.key,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isNotEmpty
        ? Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    context.read<UploadImageCubit>().imageList[index],),
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 90.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          );
  }
}
