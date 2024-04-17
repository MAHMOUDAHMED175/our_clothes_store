import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:our_clothes_store/features/admin/add_products/presentation/bloc/get_all_admin_product/get_all_admin_product_bloc.dart';
class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocConsumer<DeleteProductBloc, DeleteProductState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context.read<GetAllAdminProductBloc>().add(
                    const GetAllAdminProductEvent.getAllProducts(
                      isNotLoading: false,
                    ),
                  );
                  showToast(
                context: context,
                text: 'Your product has been deleted',
                colorText: context.color.textColor!,
                toastState: ToastStates.ERROR,
              );
             
            },
            error: (error) {
                showToast(
                context: context,
                text: error,
                colorText: context.color.textColor!,
                toastState: ToastStates.ERROR,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (id) {
              if (id == productId) {
                return SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              );
            },
            orElse: () {
              return InkWell(
                onTap: () {
                  context.read<DeleteProductBloc>().add(
                        DeleteProductEvent.deleteProduct(productId: productId),
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
      ),
    );
  }
}
