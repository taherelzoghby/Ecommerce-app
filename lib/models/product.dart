// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final dynamic rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> jsonData) => Product(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rate: jsonData['rate'],
      );
}
