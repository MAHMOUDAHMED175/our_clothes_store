
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/graphql_queries/customer/search_queries.dart';
import 'package:our_clothes_store/features/admin/add_products/data/models/get_all_product_reponse.dart';
import 'package:our_clothes_store/features/customer/search/data/models/search_request_body.dart';

class SearchDataSource {
  const SearchDataSource(this._graphql);

  final ApiService _graphql;

  // Search for product
  Future<GetAllProductResponse> searchProduct({
    required SearchRequestBody body,
  }) async {
    final response = await _graphql.searchProduct(
      SearchQueries().searchProduct(body: body),
    );
    return response;
  }
}
