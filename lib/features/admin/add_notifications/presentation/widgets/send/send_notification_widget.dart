import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/common/toast/show_toast.dart';
import 'package:our_clothes_store/core/extensions/context_extension.dart';
import 'package:our_clothes_store/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:our_clothes_store/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';

class SendNotificationWidget extends StatelessWidget {
  const SendNotificationWidget({
    required this.notificationModel,
    required this.index,
    super.key,
  });

  final AddNotificationModel notificationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            showToast(
                context: context,
                text: 'Your notifications have been send successfully',
                colorText: context.color.textColor!,
                toastState: ToastStates.SUCCECC,
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
          loading: (indexId) {
            if (index == indexId) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }
            return const Icon(
              Icons.send_rounded,
              color: Colors.green,
              size: 25,
            );
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<SendNotificationBloc>().add(
                      SendNotificationEvent.sendNotifications(
                        title: notificationModel.title,
                        body: notificationModel.body,
                        productId: notificationModel.productId,
                        indexId: index,
                      ),
                    );
              },
              child: const Icon(
                Icons.send_rounded,
                color: Colors.green,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
