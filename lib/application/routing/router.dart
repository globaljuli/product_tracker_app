import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/routing/routes.dart';
import 'package:product_tracker_app/presentation/pages/purchase_home/purchase_home_page.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/purchase_selection_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case purchaseSelectionPage:
        return MaterialPageRoute(builder: (_) => const PurchaseSelectionPage());

      case purchasePage:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => PurchaseHomePage(
            title: "Juli's Product Tracker",
            purchaseId: id,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const PurchaseSelectionPage());
    }
  }
}
