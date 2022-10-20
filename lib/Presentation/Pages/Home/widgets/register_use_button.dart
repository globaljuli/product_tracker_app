import 'package:flutter/material.dart';
import 'package:product_tracker_app/application/providers/uses/last_used_purchase_provider.dart';
import 'package:product_tracker_app/application/providerss/usess/register_use_provider.dart';
import 'package:provider/provider.dart';

class RegisterUseButton extends StatelessWidget {
  const RegisterUseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterUseProvider>(
      create: (_) => RegisterUseProvider(),
      child: Consumer<RegisterUseProvider>(
        builder: (context, useManager, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () => useManager.registerUse(context),
                  child: const Padding(
                    padding: EdgeInsets.all(60.0),
                    child: Text(
                      'Register use',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 1.0,
                    shape: const CircleBorder(),
                  ),
                ),
                const SizedBox(height: 25.0),
                Slider(
                  value: useManager.useTypeId.toDouble(),
                  min: 1.0,
                  max: 6.0,
                  divisions: 5,
                  label: useManager.getSliderLabel(),
                  onChanged: (double newValue) =>
                      useManager.changeUseTypeId(newValue),
                ),
                const SizedBox(height: 25.0),
                CheckboxListTile(
                  title: const Text("Check it to register use!"),
                  value: useManager.registerCheckboxChecked,
                  onChanged: (newValue) =>
                      useManager.changeRegisterCheckboxValue(newValue),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
