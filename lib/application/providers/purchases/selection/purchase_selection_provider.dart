import 'package:flutter/material.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/purchase/serve_purchases_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseSelectionProvider with ChangeNotifier {
  final api = ServePurchasesService();
  UserProductPurchases productPurchases =
      UserProductPurchases(openPurchases: [], closedPurchases: []);

  Future<UserProductPurchases> getPurchases() async {
    final res = await api.getAllPurchases();
    res.fold((l) => [], (r) {
      productPurchases = r;
      notifyListeners();
    });
    return productPurchases;
  }

  Future<void> selectPurchase({required Purchase purchase}) async {
    //save option in shared prefs
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_used_purchase_id', purchase.id);
  }
}

class UserProductPurchases {
  UserProductPurchases(
      {required this.openPurchases, required this.closedPurchases});
  final List<Purchase> openPurchases;
  final List<Purchase> closedPurchases;
}
