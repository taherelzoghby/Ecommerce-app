import 'package:flutter/material.dart';
import 'screens/products/AllReviews.dart';
import 'screens/carts/orderConfirmed.dart';
import 'screens/onBoarding/splashScreen.dart';

import 'constants/routes.dart';
import 'models/product.dart';
import 'screens/AppInfo.dart';
import 'screens/carts/cartsPage.dart';
import 'screens/products/detailsPage.dart';
import 'screens/developerTeam.dart';
import 'screens/home.dart';
import 'screens/login_register/login.dart';
import 'screens/login_register/register.dart';
import 'screens/onBoarding/firstPage.dart';
import 'screens/products/productsPage.dart';
import 'screens/profile/profilePage.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPageRoute:
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case appInfoPage:
        return MaterialPageRoute(builder: (_) => const AppInfo());
      case profilePageRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case developerTeamPageRoute:
        return MaterialPageRoute(builder: (_) => const developerTeam());
      case splashPageRoute:
        return MaterialPageRoute(builder: (_) => const splashScreen());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => login());
      case registerPageRoute:
        return MaterialPageRoute(builder: (_) => rigester());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => const home());
      case cartsPageRoute:
        return MaterialPageRoute(builder: (_) => cartsPage());
      case reviewsPageRoute:
        return MaterialPageRoute(builder: (_) => Reviews());
      case detailPageRoute:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => detailsPage(product: product),
        );
      case produPage:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductsPage(category: category),
        );
      case orderConfimedPageRoute:
        return MaterialPageRoute(builder: (_) => const orderConfirm());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
