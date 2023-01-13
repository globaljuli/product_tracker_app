import 'package:flutter/material.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/purchase/serve_purchases_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseSelectionProvider with ChangeNotifier {
  final api = ServePurchasesService();
  final List<Purchase> _openPurchases = [];
  List<Purchase> get openPurchases => _openPurchases;

  Future<List<Purchase>> getOpenPurchases() async {
    final res = await api.getOpenPurchases();
    res.fold((l) => [], (r) {
      _openPurchases.addAll(r);
      notifyListeners();
    });
    return _openPurchases;
  }

  Future<void> selectPurchase({required Purchase purchase}) async {
    //save option in shared prefs
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_used_purchase_id', purchase.id);
  }
}
