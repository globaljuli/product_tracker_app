import 'package:flutter/material.dart';
import 'package:product_tracker_app/Application/Providers/Uses/register_use_provider.dart';
import 'package:product_tracker_app/Presentation/Pages/Home/widgets/LastUsedProductPresenter.dart';
import 'package:product_tracker_app/Presentation/Pages/Home/widgets/RegisterUseButton.dart';

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
          ],
        ),
      ),
    );
  }
}
