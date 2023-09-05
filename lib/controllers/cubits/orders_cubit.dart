import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/order.dart';
import '../../models/product.dart';
import '../../services/firebaseService.dart';
import '../blocs/ordersPageBloc/orders_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  List<ProductOrder> ordersProduct = [];
  bool flag = false;
  double subTotal = 0;
  double shippingCost = 10;
  double Total = 0;

  ///get orders
  getOrders() async {
    emit(LoadingOrders());
    try {
      ordersProduct = await FirbaseService().getOrdersFromFirestore();
      emit(LoadedOrders());
    } catch (e) {
      emit(ErrorOrders(message: e.toString()));
    }
  }

  ///add order
  addOrder(Product product) async {
    emit(LoadingAddOrder());
    try {
      await FirbaseService().addOrderToFirestore(product: product);
      emit(SuccessAdding());
    } catch (e) {
      emit(ErrorAddOrder(message: e.toString()));
    }
  }

  ///delete order
  deleteOrder(String documentId) async {
    emit(LoadingDeleteOrder());
    try {
      await FirbaseService().deleteOrderFromFirebase(documentId: documentId);
      getOrders();
      emit(SuccessDeleting());
    } catch (e) {
      emit(ErrorDeletingOrder(message: e.toString()));
    }
  }

  /// is order exist?
  isOrder(Product product) async {
    flag = false;
    getOrders();
    print(ordersProduct);
    for (int i = 0; i < ordersProduct.length; i++) {
      if (ordersProduct[i].product.id == product.id) {
        flag = true;
        break;
      }
    }
  }

  ///update order
  updateOrder(String documentId, int orderNumbers) async {
    emit(LoadingUpdateOrder());
    try {
      await FirbaseService().updateOrderFromFirebase(
        documentId: documentId,
        orderNumbers: orderNumbers,
      );
      emit(SuccessUpdating());
    } catch (e) {
      emit(ErrorUpdatingOrder(message: e.toString()));
    }
  }

  ///IncrePrdocustOrders
  IncrePrdocustOrders(ProductOrder order) {
    order.orderNumbers++;
    emit(UpdateInDeOrder(number: order.orderNumbers));
    updateOrder(order.id, order.orderNumbers);
  }

  ///DecrePrdocustOrders
  DecrePrdocustOrders(ProductOrder order) {
    if (order.orderNumbers > 1) {
      order.orderNumbers--;
    }

    emit(UpdateInDeOrder(number: order.orderNumbers));
    updateOrder(order.id, order.orderNumbers);
  }

  ///checkOut

  checkOut() {
    Total = 0;
    subTotal = 0;
    for (int i = 0; i < ordersProduct.length; i++) {
      subTotal +=
          ordersProduct[i].orderNumbers * ordersProduct[i].product.price;
    }
    Total += subTotal + shippingCost;
    emit(CheckOut(total: Total, subTotal: subTotal));
  }
}
