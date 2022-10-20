import 'package:flutter/material.dart';
import 'package:product_tracker_app/Presentation/Pages/Home/widgets/last_used_product_presenter.dart';
import 'package:product_tracker_app/Presentation/Pages/Home/widgets/register_use_button.dart';
import 'package:product_tracker_app/Presentation/Pages/Home/widgets/uses_historic_presenter.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            LastUsedProductPresenter(),
            RegisterUseButton(),
            UsesHistoricPresenter(),
          ],
        ),
      ),
    );
  }
}
