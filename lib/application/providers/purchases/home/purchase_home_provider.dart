import 'package:flutter/material.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/purchase/serve_purchases_service.dart';

class PurchaseHomeProvider with ChangeNotifier {
  PurchaseHomeProvider({required this.lastPurchaseId});
  final lastPurchaseId;

  bool loading = false;
  Purchase? purchase;

  // String get textToShow => 'Last used product: $lastPurchaseSubmitted';

  void getLastSubmittedPurchase() async {
    loading = true;
    notifyListeners();

    final res = await ServePurchasesService().getPurchaseInfo(
      purchaseId: lastPurchaseId,
    );

    res.fold(
      (l) => null,
      (r) => purchase = r,
    );

    loading = false;
    notifyListeners();
  }
}
