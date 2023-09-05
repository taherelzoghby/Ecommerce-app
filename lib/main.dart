import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/blocs/authBloc/auth_bloc.dart';
import 'controllers/blocs/ordersPageBloc/orders_bloc.dart';
import 'observe.dart';

import 'appRoute.dart';
import 'controllers/blocs/productsPageBloc/products_page_bloc.dart';
import 'controllers/cubits/orders_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runZoned(() => Bloc.observer = Observe());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => ProductsPageBloc()),
        BlocProvider(create: (_) => OrdersBloc()),
        BlocProvider(create: (_) => OrdersCubit()),
      ],
      child: MyApp(appRoute: AppRoute()),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRoute});

  AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
