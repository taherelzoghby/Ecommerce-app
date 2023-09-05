// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:iti/models/order.dart';
import 'package:iti/models/product.dart';
import 'package:iti/services/firebaseService.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  List<ProductOrder> ordersProduct = [];
  bool flag = false;
  double subTotal = 0;
  double shippingCost = 10;
  double Total = 0;

  OrdersBloc() : super(OrdersInitial()) {
    on<GetOrdersEvent>((event, emit) async {
      emit(LoadingOrders());
      try {
        ordersProduct = await FirbaseService().getOrdersFromFirestore();
        emit(LoadedOrders());
      } catch (e) {
        emit(ErrorOrders(message: e.toString()));
      }
    });
    on<AddOrdersEvent>((event, emit) async {
      emit(LoadingAddOrder());
      try {
        await FirbaseService().addOrderToFirestore(product: event.product);
        emit(SuccessAdding());
      } catch (e) {
        emit(ErrorAddOrder(message: e.toString()));
      }
    });
    on<DeleteOrdersEvent>((event, emit) async {
      emit(LoadingDeleteOrder());
      try {
        await FirbaseService()
            .deleteOrderFromFirebase(documentId: event.documentId);
        emit(SuccessDeleting());
      } catch (e) {
        emit(ErrorDeletingOrder(message: e.toString()));
      }
    });
    on<OrderOrNotOrdersEvent>((event, emit) {
      emit(orderFind(find: false));
      print(ordersProduct);
      for (int i = 0; i < ordersProduct.length; i++) {
        if (ordersProduct[i].product.id == event.product.id) {
          emit(orderFind(find: true));
          break;
        }
      }
    });
    on<UpdateOrdersEvent>((event, emit) async {
      emit(LoadingUpdateOrder());
      try {
        await FirbaseService().updateOrderFromFirebase(
            documentId: event.documentId, orderNumbers: event.orderNumbers);
        emit(SuccessUpdating());
      } catch (e) {
        emit(ErrorUpdatingOrder(message: e.toString()));
      }
    });
    on<IncrePrdocustOrdersEvent>((event, emit) {
      event.order.orderNumbers++;
      emit(Incre(number: event.order.orderNumbers));
      UpdateOrdersEvent(
        documentId: event.order.id,
        orderNumbers: event.order.orderNumbers,
      );
    });
    on<SubProductsOrdersEvent>((event, emit) {
      event.order.orderNumbers <= 1 ? 1 : event.order.orderNumbers--;
      emit(Sub(number: event.order.orderNumbers));
      UpdateOrdersEvent(
        documentId: event.order.id,
        orderNumbers: event.order.orderNumbers,
      );
    });
    on<CheckOutOrdersEvent>((event, emit) {
      Total = 0;
      subTotal = 0;
      for (int i = 0; i < ordersProduct.length; i++) {
        subTotal +=
            ordersProduct[i].orderNumbers * ordersProduct[i].product.price;
      }
      Total += subTotal + shippingCost;
      emit(CheckOut(total: Total, subTotal: subTotal));
    });
  }
}
