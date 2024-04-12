import 'package:our_clothes_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/extensions/string_exetension.dart';
import 'package:our_clothes_store/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({
    required this.imageList,
    super.key,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
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
                if (index == indexId) {
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
                return UpdateSelectedImageWidget(
                  imageList: imageList,
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return UpdateSelectedImageWidget(
                  imageList: imageList,
                  index: index,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadUpdateImageList(
                          indexId: index,
                          productImageList: imageList,
                        );
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

class UpdateSelectedImageWidget extends StatelessWidget {
  const UpdateSelectedImageWidget({
    required this.imageList,
    required this.index,
    required this.onTap,
    super.key,
  });

  final List<String> imageList;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Image
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageList[index].imageProductFormate()),
              ),
            ),
          ),
          //Icon Button
          Container(
            height: 90.h,
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
          ),
        ],
      ),
    );
  }
}
