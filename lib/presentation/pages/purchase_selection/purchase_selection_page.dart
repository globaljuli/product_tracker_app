import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/purchases/selection/purchase_selection_provider.dart';
import 'package:product_tracker_app/application/routing/routes.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/widgets/closed_purchase_presenter.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/widgets/closed_purchases_summary.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/widgets/open_purchase_presenter.dart';
import 'package:provider/provider.dart';

class PurchaseSelectionPage extends StatelessWidget {
  const PurchaseSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Select your purchase"),
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              tabs: [
                Tab(text: "Active"),
                Tab(text: "Inactive"),
              ],
            ),
          ),
          body: ChangeNotifierProvider<PurchaseSelectionProvider>(
            create: (_) => PurchaseSelectionProvider()..getPurchases(),
            child: Consumer<PurchaseSelectionProvider>(
              builder: (context, provider, _) {
                final purchases = provider.productPurchases;

                if (purchases.openPurchases.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return TabBarView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: ListView.builder(
                      itemCount: purchases.openPurchases.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OpenPurchasePresenter(
                          purchase: purchases.openPurchases[index],
                          onTap: () {
                            return provider
                                .selectPurchase(
                                    purchase: purchases.openPurchases[index])
                                .then(
                                  (value) => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    purchasePage,
                                    (Route<dynamic> route) => false,
                                    arguments:
                                        purchases.openPurchases[index].id,
                                  ),
                                );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClosedPurchasesSummary(
                            purchases: purchases.closedPurchases,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: purchases.closedPurchases.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClosedPurchasePresenter(
                              purchase: purchases.closedPurchases[index],
                              onTap: () {
                                return provider
                                    .selectPurchase(
                                        purchase:
                                            purchases.closedPurchases[index])
                                    .then(
                                      (value) =>
                                          Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        purchasePage,
                                        (Route<dynamic> route) => false,
                                        arguments:
                                            purchases.closedPurchases[index].id,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
              },
            ),
          ),
        ));
  }
}
