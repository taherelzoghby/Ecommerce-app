// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_page_bloc.dart';

@immutable
sealed class ProductsPageEvent {}

class SearchEvent extends ProductsPageEvent {
  final String value;
  SearchEvent({required this.value});
}

class GetProductsEvent extends ProductsPageEvent {}
