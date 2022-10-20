import 'package:flutter/material.dart';
import 'package:product_tracker_app/domain/models/uses/product_use_register.dart';
import 'package:product_tracker_app/infrastructure/uses/register_use_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUseProvider with ChangeNotifier {
  bool loading = false;
  double useTypeId = 1;
  int? purchaseId;
  bool _registerCheckboxChecked = false;

  RegisterUseProvider();

  changeUseTypeId(double newValue) {
    useTypeId = newValue;
    notifyListeners();
  }

  bool get registerCheckboxChecked => _registerCheckboxChecked;

  void changeRegisterCheckboxValue(bool? newValue) {
    _registerCheckboxChecked = newValue!;
    notifyListeners();
  }

  String getSliderLabel() {
    switch (useTypeId.toInt()) {
      case 1:
        return "Very Little (0.25)";
      case 2:
        return "Little (0.5)";
      case 3:
        return "Regular (1)";
      case 4:
        return "More than normal (1.5)";
      case 5:
        return "A lot (2)";
      case 6:
        return "Triple than normal (3)";
      default:
        return "Out of range";
    }
  }

  void registerUse(BuildContext context) async {
    if (!_registerCheckboxChecked) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Check the checkbox to be sure, please!'),
      ));
      return;
    }
    loading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final int? lastPurchaseSubmitted = prefs.getInt('last_used_purchase_id');

    if (lastPurchaseSubmitted == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No product used yet'),
      ));
      return;
    }

    final ps = ProductUseRegister(
      purchaseId: lastPurchaseSubmitted,
      useTypeId: useTypeId.toInt(),
    );
    final res = await RegisterUseService().registerUse(use: ps);

    res.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${l.message}'),
        ));
      },
      (r) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Everything went well!'),
          backgroundColor: Colors.green,
        ));

        _registerCheckboxChecked = false;
        prefs.setInt('last_used_purchase_id', lastPurchaseSubmitted);
      },
    );

    loading = false;
    notifyListeners();
  }
}
