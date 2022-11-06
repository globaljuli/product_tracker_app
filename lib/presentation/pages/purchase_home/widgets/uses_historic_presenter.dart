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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Text(DateFormat.yMMMEd().format(e.createdAt)),
                    Text(e.purchaseName),
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
