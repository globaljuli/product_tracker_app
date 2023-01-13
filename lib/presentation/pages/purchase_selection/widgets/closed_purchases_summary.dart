import 'package:flutter/cupertino.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';

class ClosedPurchasesSummary extends StatelessWidget {
  final List<Purchase> purchases;
  const ClosedPurchasesSummary({Key? key, required this.purchases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double averageUse = 0.0;
    for (var purchase in purchases) {
      averageUse += double.parse(purchase.pricePerUse);
    }
    averageUse = averageUse / purchases.length;
    final formattedAverage = averageUse.toStringAsFixed(3);

    return Text("Average price per use: $formattedAverage €");
  }
}
