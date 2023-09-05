// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_page_bloc.dart';

@immutable
sealed class ProductsPageState {}

final class ProductsPageInitial extends ProductsPageState {}

class LoadingProducts extends ProductsPageState {}

class LoadedProducts extends ProductsPageState {}

class ErrorProducts extends ProductsPageState {
  final String message;
  ErrorProducts({required this.message});
}

class LoadingSearch extends ProductsPageState {}

class LoadedSearch extends ProductsPageState {}

class ErrorSearch extends ProductsPageState {
  final String message;
  ErrorSearch({required this.message});
}
