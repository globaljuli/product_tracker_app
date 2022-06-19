import 'package:flutter/material.dart';
import 'package:product_tracker_app/Domain/Models/Products/Product.dart';
import 'package:product_tracker_app/Domain/Models/Purchase/Purchase.dart';
import 'package:product_tracker_app/Infrastructure/Purchase/ServePurchasesService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LastUsedPurchaseProvider with ChangeNotifier {
  int? lastPurchaseSubmitted;
  bool loading = false;
  Purchase? purchase;

  final List<String> dropdownStrings = ["0", "AAAA", "BBBB"];

  final List<DropdownMenuItem<int>> dropdownItems =
      [1, 2].map<DropdownMenuItem<int>>((int value) {
    return DropdownMenuItem<int>(
      value: value,
      child: Text(
        value.toString(),
        style: TextStyle(color: Colors.black),
      ),
    );
  }).toList();

  LastUsedPurchaseProvider() {
    _getLastSubmittedPurchase();
  }

  String? get textToShowInDropdown =>
      dropdownStrings[lastPurchaseSubmitted ?? 0];

  String get textToShow => lastPurchaseSubmitted == null
      ? 'No product used yet'
      : 'Last used product: $lastPurchaseSubmitted';

  void _getLastSubmittedPurchase() async {
    loading = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    lastPurchaseSubmitted = prefs.getInt('last_used_purchase_id');

    if (lastPurchaseSubmitted != null) {
      final res = await ServePurchasesService().getPurchaseInfo(
        purchaseId: lastPurchaseSubmitted!,
      );

      purchase = res.fold(
        (l) => null,
        (r) => purchase = r,
      );
    }
    loading = false;
    notifyListeners();
  }

  changeSelectedProduct(Object? newItem) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_used_purchase_id', newItem as int);
    _getLastSubmittedPurchase();
  }
}
