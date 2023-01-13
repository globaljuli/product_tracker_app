import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/purchases/selection/purchase_selection_provider.dart';
import 'package:product_tracker_app/application/routing/routes.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/widgets/purchase_presenter.dart';
import 'package:provider/provider.dart';

class PurchaseSelectionPage extends StatelessWidget {
  const PurchaseSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your purchase"),
      ),
      body: ChangeNotifierProvider<PurchaseSelectionProvider>(
        create: (_) => PurchaseSelectionProvider()..getOpenPurchases(),
        child: Consumer<PurchaseSelectionProvider>(
          builder: (context, provider, _) {
            final purchases = provider.openPurchases;
            if (purchases.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: ListView.builder(
                itemCount: purchases.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PurchasePresenter(
                    purchase: purchases[index],
                    onTap: () {
                      return provider
                          .selectPurchase(purchase: purchases[index])
                          .then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              purchasePage,
                              (Route<dynamic> route) => false,
                              arguments: purchases[index].id,
                            ),
                          );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
