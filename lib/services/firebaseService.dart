import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/collections.dart';
import '../models/order.dart';
import '../models/product.dart';

class FirbaseService {
  CollectionReference orders = fireBase.collection(ordersCollection);

  //get products from firestore
  Future<List<Product>> getProductsFromFirestore() async {
    List<Product> products = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await fireBase.collection(productsCollection).get();
      if (querySnapshot.docs.isNotEmpty) {
        products = querySnapshot.docs
            .map(
              (doc) => Product.fromJson(doc.data()),
            )
            .toList();
      }
      return products;
    } catch (e) {
      // Error occurred while retrieving data
      throw Exception('Error retrieving data: $e');
    }
  }

  //get orders from firestore
  Future<List<ProductOrder>> getOrdersFromFirestore() async {
    List<ProductOrder> orders = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await fireBase.collection(ordersCollection).get();
      if (querySnapshot.docs.isNotEmpty) {
        orders = querySnapshot.docs
            .map(
              (doc) => ProductOrder.fromJson(doc.data(), doc.id),
            )
            .toList();
      }
      return orders;
    } catch (e) {
      // Error occurred while retrieving data
      throw Exception('Error retrieving data: $e');
    }
  }

  //add order from firestore
  addOrderToFirestore({required Product product}) async {
    return orders
        .add({
          'product': {
            'id': product.id,
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'category': product.category,
            'image': product.image,
            'rate': product.rate,
          },
          'orderNumbers': 1,
        })
        .then((value) => print("User Added ${value.id}"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //delete order
  deleteOrderFromFirebase({required String documentId}) async {
    try {
      await fireBase.collection(ordersCollection).doc(documentId).delete();
      print('Document deleted: $documentId');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  //update order
  updateOrderFromFirebase(
      {required String documentId, required int orderNumbers}) async {
    try {
      await fireBase
          .collection(ordersCollection)
          .doc(documentId)
          .update({'orderNumbers': orderNumbers});
      print('Document updated: $documentId - $orderNumbers');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}
