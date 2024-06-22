


import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/customer/products_view_all_queries.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/get_all_product_reponse.dart';

class ProductsViewAllDataSource {
  const ProductsViewAllDataSource(this._graphql);

  final ApiService _graphql;

  //get catgeory
  Future<GetAllProductResponse> getProductsViewAll({required int offset}) async {
    final response = await _graphql.getProductsViewAll(
        ProductViewAllQueries().getProductsViewAllMapQuery(offset: offset),);
    return response;
  }
}
