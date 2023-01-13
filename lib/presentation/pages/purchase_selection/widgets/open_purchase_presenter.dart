import 'package:flutter/material.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';

class OpenPurchasePresenter extends StatelessWidget {
  const OpenPurchasePresenter({
    Key? key,
    required this.purchase,
    required this.onTap,
    this.height = 90,
  }) : super(key: key);
  final Purchase purchase;
  final Function onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ListTile(
        onTap: () => onTap(),
        leading: Icon(Icons.sanitizer),
        title: Text('${purchase.product.brand} - ${purchase.product.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(purchase.shop.name),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${purchase.price.toString()} €',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '(${purchase.pricePerUse}/use)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
