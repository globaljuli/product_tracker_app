import 'package:flutter/cupertino.dart';
import 'package:product_tracker_app/Application/helpers/serve_uses/serve_uses_helper.dart';
import 'package:product_tracker_app/Domain/Models/Uses/ProductUse.dart';

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
