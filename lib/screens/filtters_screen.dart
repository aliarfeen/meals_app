import 'package:flutter/material.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/widgets/rounded_appbar.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({super.key});

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  var _isGlutenFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RoundedAppbar(appBarTitle: 'Filtered data', context: context),
        body: Column(
          children: [
            SwitchListTile(
              title: const Text(
                'Gluten-free',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Only include gluten-free meals'),
              value: _isGlutenFree,
              activeColor: AppColors.hColor,
              onChanged: (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              },
            ),
          ],
        ));
  }
}
