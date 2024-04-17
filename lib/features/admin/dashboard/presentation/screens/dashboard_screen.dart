
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_clothes_store/core/common/widgets/admin_app_bar.dart';
import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/core/style/colors/colors_dark.dart';
import 'package:our_clothes_store/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:our_clothes_store/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:our_clothes_store/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:our_clothes_store/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsNumberBloc>()
            ..add(const ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesNumberBloc>()
            ..add(const CategoriesNumberEvent.getCategoriesNumber()),
        ),
        BlocProvider(
          create: (context) => sl<UsersNumberBloc>()
            ..add(const UsersNumberEvent.getUsersNumber()),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'DashBoard',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: DashBoardBody(),
      ),
    );
  }
}
