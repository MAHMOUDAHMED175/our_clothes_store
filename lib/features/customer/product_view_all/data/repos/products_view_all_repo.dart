
import 'package:our_clothes_store/core/services/graphql/api_result.dart';
import 'package:our_clothes_store/core/utils/app_strings.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/get_all_product_reponse.dart';
import 'package:our_clothes_store/features/customer/product_view_all/data/data_source/products_view_all_data_source.dart';

class ProductsViewAllRepo {
  const ProductsViewAllRepo(this._dataSource);

  final ProductsViewAllDataSource _dataSource;

  // Get Category
  Future<ApiResult<GetAllProductResponse>> getProductsViewAll({
    required int offset,
  }) async {
    try {
      final response = await _dataSource.getProductsViewAll(offset: offset);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
