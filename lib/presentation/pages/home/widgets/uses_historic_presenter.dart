import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_tracker_app/application/providers/uses/show_uses_provider.dart';

class UsesHistoricPresenter extends StatelessWidget {
  const UsesHistoricPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowUsesProvider>(
      create: (_) => ShowUsesProvider(),
      child: Consumer<ShowUsesProvider>(
        builder: (context, _sup, child) {
          return Table(
            children: _sup.productUses.map((e) => e.toTableRow()).toList(),
          );
        },
      ),
    );
  }
}
