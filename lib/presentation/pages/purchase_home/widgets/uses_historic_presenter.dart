import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:product_tracker_app/application/providers/uses/show_uses_provider.dart';

class UsesHistoricPresenter extends StatelessWidget {
  const UsesHistoricPresenter({required this.purchaseId});
  final int purchaseId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowUsesProvider>(
      create: (context) => ShowUsesProvider(purchaseId: purchaseId),
      child: Consumer<ShowUsesProvider>(
        builder: (context, _sup, child) {
          if (_sup.productUses.isEmpty) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 64.0),
              child: Text("There are no uses for this purchase"),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 1.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 24.0),
                child:
                    Text("Uses for this purchase (${_sup.productUses.length})",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              Table(
                children: _sup.productUses.map((e) {
                  return TableRow(children: [
                    Text(DateFormat.yMMMMd().format(e.createdAt)),
                    Text('${e.product.brand} - ${e.product.name}'),
                  ]);
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
