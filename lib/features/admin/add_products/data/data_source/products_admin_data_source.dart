
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/admin/products_queries.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/get_all_product_reponse.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/update_product_request_body.dart';

class ProductsAdminDataSource {
  const ProductsAdminDataSource(this._graphql);

  final ApiService _graphql;


  // Get All products admin
  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql
        .getAllProduct(ProductsQueries().getAllProductsMapQuery());
    return response;
  }

  // Create products admin
  Future<void> createProductsAdmin({
    required CreateProductRequestBody body,
  }) async {
    final response = await _graphql
        .createProduct(ProductsQueries().createProductMap(body: body));
    return response;
  }

  // delete products
  Future<void> deleteProducts({
    required String productId,
  }) async {
    final response = await _graphql
        .deleteProduct(ProductsQueries().deleteMapQuery(productId: productId));
    return response;
  }

  // Update products admin
  Future<void> updateProductsAdmin({
    required UpdateProductRequestBody body,
  }) async {
    final response = await _graphql
        .updateProduct(ProductsQueries().updateProductMap(body: body));
    return response;
  }
}
