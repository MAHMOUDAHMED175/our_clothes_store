
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_clothes_store/core/common/widgets/customer_app_bar.dart';
import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/features/customer/category/persentation/bloc/get_category/get_category_bloc.dart';
import 'package:our_clothes_store/features/customer/category/persentation/refactors/category_body.dart';

class CatgeoryScreen extends StatelessWidget {
  const CatgeoryScreen({required this.categoryInfo, super.key});

//Record  زى ال list بتاخد اكتر من قيمه انا عملتها عشان فى ال route لازم ابعت قيمه واحده فمش هعرف ابعت اكتر من قيمه فعملت ال 
//Record  عشان يشيل اكتر من قيمه 
//Record

  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryBloc>()
        ..add(
          GetCategoryEvent.getCategory(categoryId: categoryInfo.categoryId),
        ),
      child: Scaffold(
        appBar: CustomAppBar(title: categoryInfo.categoryName),
        body: const CategoryBody(),
      ),
    );
  }
}
