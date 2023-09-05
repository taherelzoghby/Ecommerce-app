// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iti/constants/routes.dart';
import 'package:iti/constants/theme.dart';
import 'package:iti/controllers/blocs/productsPageBloc/products_page_bloc.dart';
import 'package:iti/models/product.dart';
import 'package:iti/widgets/customTextField.dart';
import 'package:iti/widgets/itemProduct.dart';

// ignore: must_be_immutable
class ProductsPage extends StatelessWidget {
  ProductsPage({
    super.key,
    required this.category,
  });
  String category;
  List<Product> allProducts = [];
  List<Product> allProductsFiltering = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: BlocBuilder<ProductsPageBloc, ProductsPageState>(
          builder: (context, state) {
            if (state is LoadingProducts) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedProducts) {
              ProductsPageBloc bloc =
                  BlocProvider.of<ProductsPageBloc>(context);
              //filering
              List<Product> prods =
                  bloc.isSearching ? bloc.allProductsFiltering : bloc.products;
              allProducts = category.isEmpty
                  ? prods
                  : prods
                      .where((element) => element.category == category)
                      .toList();
              return Column(
                children: [
                  //products title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 18),
                    child: Row(
                      children: [
                        category.isEmpty
                            ? Container()
                            : IconButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(homePageRoute),
                                icon: const Icon(Icons.arrow_back),
                              ),
                        Text(
                          category.isEmpty ? 'Products' : category,
                          style: Themes().subHeadingStyle,
                        ),
                      ],
                    ),
                  ),
                  //search field
                  Padding(
                    padding: const EdgeInsets.only(top: 9, left: 10, right: 10),
                    child: customTextField(
                      hint: 'Search',
                      OnChanged: (value) =>
                          BlocProvider.of<ProductsPageBloc>(context).add(
                        SearchEvent(value: value),
                      ),
                      color: white,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  //products
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GridView.builder(
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            columnCount: 2,
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: itemProduct(
                                  product: allProducts[index],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 3.2 / 4,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
