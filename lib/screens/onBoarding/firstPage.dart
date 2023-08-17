import 'package:flutter/material.dart';
import '../../constants/theme.dart';
import 'firstPage1.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import '../../constants/routes.dart';
import '../../controllers/controllerProvider.dart';
import '../widgets/customButton.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    context.read<controller>().getProducts();
    context.read<controller>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              children: const [
                introPage(
                  image: "assets/images/shop.svg",
                  title: 'Find your favourite items',
                  subTitle:
                      'Find your favourite products\n that you need to buy daily.',
                ),
                introPage(
                  image: "assets/images/delivery.svg",
                  title: 'Product Delivery',
                  subTitle:
                      'Yours products are delivered\n    home safely & security.',
                ),
              ],
              onPageChanged: (value) => setState(() => selectedPage = value),
            ),
            Align(
              alignment: const Alignment(.6, .6),
              child: PageViewDotIndicator(
                currentItem: selectedPage,
                count: 2,
                unselectedColor: Colors.black26,
                selectedColor: initialColor,
              ),
            ),
            Align(
              alignment: const Alignment(0, .78),
              child: customButton(
                label: 'Get Started',
                on_tab: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginPageRoute, (_) => false),
                color: initialColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
