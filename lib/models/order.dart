// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:iti/models/product.dart';

class ProductOrder {
  final dynamic id;
  final Product product;
  int orderNumbers;
  ProductOrder({
    required this.id,
    required this.product,
    required this.orderNumbers,
  });
  factory ProductOrder.fromJson(Map<String, dynamic> jsonData, dynamic id) =>
      ProductOrder(
        id: id,
        product: Product.fromJson(jsonData['product']),
        orderNumbers: jsonData['orderNumbers'],
      );
}
