import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/uses/last_used_purchase_provider.dart';
import 'package:product_tracker_app/presentation/pages/home/widgets/last_used_product_presenter.dart';
import 'package:product_tracker_app/presentation/pages/home/widgets/register_use_button.dart';
import 'package:product_tracker_app/presentation/pages/home/widgets/uses_historic_presenter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<LastUsedPurchaseProvider>(
            create: (_) => LastUsedPurchaseProvider(),
            child: Consumer<LastUsedPurchaseProvider>(
              builder: (context, lastProductProvider, _) {
                return Column(
                  children: [
                    LastUsedProductPresenter(),
                    RegisterUseButton(),
                    UsesHistoricPresenter(
                      purchaseId: lastProductProvider.purchase?.id,
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
