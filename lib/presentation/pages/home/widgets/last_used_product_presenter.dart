import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/uses/last_used_purchase_provider.dart';
import 'package:provider/provider.dart';

class LastUsedProductPresenter extends StatelessWidget {
  const LastUsedProductPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LastUsedPurchaseProvider>(
      builder: (context, lastProductProvider, _) {
        if (lastProductProvider.loading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (lastProductProvider.lastPurchaseSubmitted == null) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Text(lastProductProvider.textToShow),
                DropdownButton(
                    items: lastProductProvider.dropdownItems,
                    onChanged: (newItem) =>
                        lastProductProvider.changeSelectedProduct(newItem)),
              ],
            ),
          );
        }

        if (lastProductProvider.purchase == null) {
          return Text("There's no purchases to show");
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lastProductProvider.purchase!.product.name.toString() +
                          ' - ' +
                          lastProductProvider.purchase!.price.toString() +
                          '€',
                    ),
                    DropdownButton(
                        items: lastProductProvider.dropdownItems,
                        onChanged: (newItem) =>
                            lastProductProvider.changeSelectedProduct(newItem))
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Uses: (' +
                        lastProductProvider.purchase!.uses.toString() +
                        ')'),
                    const SizedBox(width: 10.0),
                    Text(
                      'Price per use: (' +
                          (lastProductProvider.purchase!.price /
                                  lastProductProvider.purchase!.uses)
                              .toStringAsFixed(2) +
                          '€)',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
