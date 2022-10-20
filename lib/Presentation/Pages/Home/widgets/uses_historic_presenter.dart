import 'package:flutter/cupertino.dart';
import 'package:product_tracker_app/Application/Providers/Uses/show_uses_provider.dart';
import 'package:provider/provider.dart';

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
