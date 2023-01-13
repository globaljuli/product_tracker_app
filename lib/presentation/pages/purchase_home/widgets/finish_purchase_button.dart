import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/purchases/home/purchase_home_provider.dart';
import 'package:product_tracker_app/domain/models/purchase/purchase.dart';
import 'package:product_tracker_app/infrastructure/purchase/finish_purchase_service.dart';
import 'package:provider/provider.dart';

class FinishPurchaseButton extends StatelessWidget {
  const FinishPurchaseButton({Key? key, required this.purchase})
      : super(key: key);
  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () async {
          final bool res = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Warning!"),
                  content: Text(purchase.finishedAt == null
                      ? "You're about to mark this purchase as finished on date now: ${_getDate()}. \n Do you want to continue?"
                      : "You're about to REACTIVATE this purchase and be able to register uses again. \n Do you want to continue?"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text("Not yet!")),
                    TextButton(
                        onPressed: () => _markPurchaseAsFinished(context),
                        child: Text("Sure!")),
                  ],
                ),
              ) ??
              false;

          if (res) {
            Provider.of<PurchaseHomeProvider>(context, listen: false)
                .getLastSubmittedPurchase();
          }
        },
        child: Text(
          purchase.finishedAt == null
              ? "Set purchase as finished"
              : "Reactivate this purchase",
        ),
      ),
    );
  }

  _markPurchaseAsFinished(BuildContext context) {
    FinishPurchaseService().markPurchaseAsFinished(
      purchaseId: purchase.id,
    );
    return Navigator.pop(context, true);
  }

  _getDate() {
    final DateTime now = DateTime.now();
    return '${now.day}/${now.month}/${now.year}';
  }
}

class _ClosedPurchaseButton {}

class _OpenPurchaseButton {}
