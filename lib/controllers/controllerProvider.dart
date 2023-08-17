import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../services/fairebaseAuth.dart';
import '../models/order.dart';
import '../models/product.dart';
import '../services/firebaseService.dart';

class controller with ChangeNotifier {
  List<ProductOrder> ordersProduct = [];
  List<Product> products = [];
  List<Product> allProductsFiltering = [];
  bool isSearching = false;
  bool flag = false;
  double subTotal = 0;
  double shippingCost = 10;
  double Total = 0;
  //search
  seachField(String value) {
    isSearching = true;
    allProductsFiltering = products
        .where(
          (element) => element.title.toLowerCase().startsWith(
                value.toLowerCase(),
              ),
        )
        .toList();
    notifyListeners();
  }

  //get Orders
  getOrders() async {
    ordersProduct = await FirbaseService().getOrdersFromFirestore();
    notifyListeners();
  }

  //add order
  addOrder({required Product product}) {
    FirbaseService().addOrderToFirestore(product: product);
    notifyListeners();
  }

  //get products
  getProducts() async {
    products = await FirbaseService().getProductsFromFirestore();
    notifyListeners();
  }

  //delete order
  deleteOrder({required String documentId}) {
    FirbaseService().deleteOrderFromFirebase(documentId: documentId);
    getOrders();
  }

// is Order
  orderOrNot(Product product) {
    getOrders();
    for (int i = 0; i < ordersProduct.length; i++) {
      if (ordersProduct[i].product.id == product.id) {
        flag = true;
        return;
      }
    }
    flag = false;
    notifyListeners();
  }

  updatedOrder({required String documentId, required int orderNumbers}) {
    FirbaseService().updateOrderFromFirebase(
        documentId: documentId, orderNumbers: orderNumbers);
    notifyListeners();
  }

  //add
  addPro(ProductOrder order) {
    order.orderNumbers++;
    updatedOrder(documentId: order.id, orderNumbers: order.orderNumbers);
  }

  //subtract
  subPro(ProductOrder order) {
    order.orderNumbers <= 1 ? 1 : order.orderNumbers--;
    updatedOrder(documentId: order.id, orderNumbers: order.orderNumbers);
  }

//checkout
  checkOut() {
    initialPrice();

    for (int i = 0; i < ordersProduct.length; i++) {
      subTotal +=
          ordersProduct[i].orderNumbers * ordersProduct[i].product.price;
    }
    Total += subTotal + shippingCost;
    notifyListeners();
  }

  initialPrice() {
    Total = 0;
    subTotal = 0;
    notifyListeners();
  }

  signOut(context) async {
    await firebaseAuth().sighOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(loginPageRoute, (route) => false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
