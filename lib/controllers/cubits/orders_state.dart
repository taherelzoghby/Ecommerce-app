part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

///Orders
class LoadingOrders extends OrdersState {}

class LoadedOrders extends OrdersState {}

class ErrorOrders extends OrdersState {
  final String message;
  ErrorOrders({
    required this.message,
  });
}

///Adding
class LoadingAddOrder extends OrdersState {}

class SuccessAdding extends OrdersState {}

class ErrorAddOrder extends OrdersState {
  final String message;
  ErrorAddOrder({required this.message});
}

///deleting
class LoadingDeleteOrder extends OrdersState {}

class SuccessDeleting extends OrdersState {}

class ErrorDeletingOrder extends OrdersState {
  final String message;
  ErrorDeletingOrder({required this.message});
}

///update
class LoadingUpdateOrder extends OrdersState {}

class SuccessUpdating extends OrdersState {}

class ErrorUpdatingOrder extends OrdersState {
  final String message;
  ErrorUpdatingOrder({required this.message});
}

// ignore: must_be_immutable
class UpdateInDeOrder extends OrdersState {
  int number;
  UpdateInDeOrder({required this.number});
}



// ignore: must_be_immutable
class CheckOut extends OrdersState {
  double total;
  double subTotal;
  CheckOut({required this.total, required this.subTotal});
}

class OrderFind extends OrdersState {
  final bool find;
  OrderFind({required this.find});
}
