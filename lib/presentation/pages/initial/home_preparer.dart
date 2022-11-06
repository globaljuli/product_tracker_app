import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePreparer extends StatefulWidget {
  HomePreparer({Key? key}) : super(key: key);

  @override
  State<HomePreparer> createState() => _HomePreparerState();
}

class _HomePreparerState extends State<HomePreparer> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      final lastPurchaseId = prefs.getInt('last_used_purchase_id');
      if (lastPurchaseId == null) {
        return Navigator.pushReplacementNamed(context, purchaseSelectionPage);
      }
      return Navigator.pushReplacementNamed(
        context,
        purchasePage,
        arguments: lastPurchaseId,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
