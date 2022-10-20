import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/helpers/serve_uses/serve_uses_helper.dart';
import 'package:product_tracker_app/domain/models/uses/product_use.dart';

class ShowUsesProvider with ChangeNotifier {
  ShowUsesProvider() {
    getUses();
  }
  List<ProductUse> productUses = [];

  Future<void> getUses() async {
    final helper = ServeUsesHelper();
    productUses = await helper.getUses();
    notifyListeners();
  }
}
