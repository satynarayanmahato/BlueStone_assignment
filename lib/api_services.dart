import 'package:dio/dio.dart';
import 'product.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<List<Product>> fetchProducts(int limit) async {
    try {
      final response = await _dio.get('products', queryParameters: {'limit': limit});
      return (response.data as List)
          .map((data) => Product.fromJson(data))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<Product> fetchProductDetails(int productId) async {
    try {
      final response = await _dio.get('products/$productId');
      return Product.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch product details: $e');
    }
  }
}
