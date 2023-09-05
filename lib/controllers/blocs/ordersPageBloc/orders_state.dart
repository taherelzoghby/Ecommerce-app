// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_bloc.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

///Orders
class LoadingOrders extends OrdersState {}

class LoadedOrders extends OrdersState {}

class ErrorOrders extends OrdersState {
  final String message;
  ErrorOrders({
    required this.message,
  });
}

//Adding
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

/// ignore: must_be_immutable
class Incre extends OrdersState {
  int number;
  Incre({required this.number});
}

/// ignore: must_be_immutable
class Sub extends OrdersState {
  int number;
  Sub({required this.number});
}

// ignore: must_be_immutable
class CheckOut extends OrdersState {
  double total;
  double subTotal;
  CheckOut({required this.total, required this.subTotal});
}

class orderFind extends OrdersState {
  final bool find;
  orderFind({required this.find});
}
