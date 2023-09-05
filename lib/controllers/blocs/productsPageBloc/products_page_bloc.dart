// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:iti/models/product.dart';
import 'package:iti/services/firebaseService.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'products_page_event.dart';
part 'products_page_state.dart';

class ProductsPageBloc extends Bloc<ProductsPageEvent, ProductsPageState> {
  List<Product> products = [];
  List<Product> allProductsFiltering = [];

  bool isSearching = false;
  ProductsPageBloc() : super(ProductsPageInitial()) {
    on<ProductsPageEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(LoadedProducts());
        try {
          products = await FirbaseService().getProductsFromFirestore();
          emit(LoadedProducts());
        } catch (e) {
          emit(ErrorProducts(message: e.toString()));
        }
      } else if (event is SearchEvent) {
        try {
          isSearching = true;
          allProductsFiltering = products
              .where(
                (element) => element.title
                    .toLowerCase()
                    .startsWith(event.value.toLowerCase()),
              )
              .toList();
          isSearching = false;

          // ignore: empty_catches
        } catch (e) {}
      }
    });
  }
}
