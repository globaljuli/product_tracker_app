import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/purchases/home/purchase_home_provider.dart';
import 'package:product_tracker_app/presentation/pages/purchase_home/widgets/purchase_home_presenter.dart';
import 'package:product_tracker_app/presentation/pages/purchase_home/widgets/register_use_button.dart';
import 'package:product_tracker_app/presentation/pages/purchase_home/widgets/uses_historic_presenter.dart';
import 'package:provider/provider.dart';

class PurchaseHomePage extends StatelessWidget {
  const PurchaseHomePage(
      {Key? key, required this.title, required this.purchaseId})
      : super(key: key);

  final String title;
  final int purchaseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<PurchaseHomeProvider>(
            create: (_) => PurchaseHomeProvider(lastPurchaseId: purchaseId)
              ..getLastSubmittedPurchase(),
            child: Consumer<PurchaseHomeProvider>(
              builder: (context, lastProductProvider, _) {
                return Column(
                  children: [
                    PurchaseHomePresenter(),
                    RegisterUseButton(),
                    lastProductProvider.purchase == null
                        ? Text("No purchases")
                        : UsesHistoricPresenter(
                            purchaseId: lastProductProvider.purchase!.id,
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
