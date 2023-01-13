import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/purchases/home/purchase_home_provider.dart';
import 'package:product_tracker_app/application/routing/routes.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/presentation/pages/purchase_selection/widgets/purchase_presenter.dart';
import 'package:provider/provider.dart';

class PurchaseHomePresenter extends StatelessWidget {
  const PurchaseHomePresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseHomeProvider>(
      builder: (context, lastProductProvider, _) {
        final purchase = lastProductProvider.purchase as Purchase;

        return Column(
          children: [
            PurchasePresenter(
              purchase: purchase,
              onTap: () => Navigator.pushNamed(context, purchaseSelectionPage),
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                title: Text('Uses: ${purchase.uses}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Price per use'),
                    SizedBox(height: 8.0),
                    Text('${purchase.pricePerUse} €')
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
