import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/helpers/serve_uses/serve_uses_helper.dart';
import 'package:product_tracker_app/domain/models/uses/purchase_use.dart';

class ShowUsesProvider with ChangeNotifier {
  final ServeUsesHelper _helper = ServeUsesHelper();

  ShowUsesProvider({required int purchaseId}) {
    getUses(purchaseId: purchaseId);
  }

  final List<PurchaseUse> productUses = [];

  Future<void> getUses({required int purchaseId}) async {
    productUses.clear();
    final res = await _helper.getUses(purchaseId: purchaseId);
    productUses.addAll(res);
    notifyListeners();
  }
}
