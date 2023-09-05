// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_bloc.dart';

@immutable
sealed class OrdersEvent {}

class GetOrdersEvent extends OrdersEvent {}

class AddOrdersEvent extends OrdersEvent {
  final Product product;
  AddOrdersEvent({required this.product});
}

class DeleteOrdersEvent extends OrdersEvent {
  final String documentId;
  DeleteOrdersEvent({required this.documentId});
}

class OrderOrNotOrdersEvent extends OrdersEvent {
  final Product product;
  OrderOrNotOrdersEvent({required this.product});
}

class UpdateOrdersEvent extends OrdersEvent {
  final String documentId;
  final int orderNumbers;
  UpdateOrdersEvent({required this.documentId, required this.orderNumbers});
}

class IncrePrdocustOrdersEvent extends OrdersEvent {
  final ProductOrder order;
  IncrePrdocustOrdersEvent({required this.order});
}

class SubProductsOrdersEvent extends OrdersEvent {
  final ProductOrder order;
  SubProductsOrdersEvent({required this.order});
}

class CheckOutOrdersEvent extends OrdersEvent {}
