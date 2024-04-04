import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:our_clothes_store/core/style/images/app_images.dart';

class UserAvararImage extends StatelessWidget {
  const UserAvararImage({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundImage: const AssetImage(AppImages.userAvatar),
      backgroundColor: Colors.grey.withOpacity(.1),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: -15,
            right: -15,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox.shrink(),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
