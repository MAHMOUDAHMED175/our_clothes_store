import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_clothes_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:our_clothes_store/core/common/screen/custom_web_view.dart';
import 'package:our_clothes_store/core/common/screen/under_build_screen.dart';
import 'package:our_clothes_store/core/di/injection_container.dart';
import 'package:our_clothes_store/core/routes/base_routes.dart';
import 'package:our_clothes_store/features/admin/home_admin/presentatoin/screens/home_admin_screen.dart';
import 'package:our_clothes_store/features/auth/presentation/view/screens/login_screen.dart';
import 'package:our_clothes_store/features/auth/presentation/view/screens/sign_up_screen.dart';
import 'package:our_clothes_store/features/auth/presentation/view_model/bloc/auth_bloc.dart';
import 'package:our_clothes_store/features/customer/category/persentation/screen/category_screen.dart';
import 'package:our_clothes_store/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:our_clothes_store/features/customer/main/presentation/screen/main_screen.dart';
import 'package:our_clothes_store/features/customer/product_details/presentation/screen/product_details_screen.dart';
import 'package:our_clothes_store/features/customer/product_view_all/presentation/screen/products_view_all_screen.dart';
import 'package:our_clothes_store/features/customer/search/presentation/screen/search_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeAdmin = 'homeAdmin';
  static const String mainCustomer = 'main-screen';
  static const String webview = 'webView';
  static const String productDetails = 'product-details';
  static const String category = 'catgeory';
  static const String productsViewAll = 'productsViewAll';
  static const String search = 'search';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: const SignUpScreen(),
          ),
        );
      case homeAdmin:
        return BaseRoute(page: const HomeAdminScreen());
        case mainCustomer:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<MainCubit>(),
            child: const MainScreen(),
          ),
        );
      case webview:
        return BaseRoute(
          page: CustomWebView(
            url: args! as String,
          ),
        );
        
      case productDetails:
        return BaseRoute(
          page: ProductDetailsScreen(
            productId: args! as int,
          ),
        );
      case category:
        return BaseRoute(
          page: CatgeoryScreen(
            categoryInfo: args! as ({int categoryId, String categoryName}),
          ),
        );
      case productsViewAll:
        return BaseRoute(
          page: const ProductsViewAllScreen(),
        );
       case search:
        return BaseRoute(
          page: const SearchScreen(),
        );

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
