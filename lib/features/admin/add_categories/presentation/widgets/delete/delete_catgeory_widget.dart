import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/core/style/colors/colors_dark.dart';
import 'package:our_clothes_store/features/admin/add_categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:our_clothes_store/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({
    required this.categoryId,
    super.key,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllAdminCategoriesBloc>().add(
                  const GetAllAdminCategoriesEvent.fetchAdminCategories(
                    isNotLoading: false,
                  ),
                );
            showToast(
              context: context,
              text: 'Your category has been deleted',
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
          loading: (id) {
            if (id == categoryId) {
              return SizedBox(
                height: 15.h,
                width: 15.w,
                child: const CircularProgressIndicator(
                  color: ColorsDark.white,
                ),
              );
            } else {
              return const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              );
            }
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<DeleteCategoryBloc>().add(
                      DeleteCategoryEvent.deleteCatgeory(
                        categoryId: categoryId,
                      ),
                    );
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
