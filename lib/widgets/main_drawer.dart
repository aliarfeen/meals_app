import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/filtters_screen.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  var _isGlutenFree = false;
  var _isvegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _isGlutenFree = activeFilters[Filters.isGlutenFree]!;
    _isvegan = activeFilters[Filters.isVegan]!;
    _isVegetarian = activeFilters[Filters.isVegetarian]!;
    _isLactoseFree = activeFilters[Filters.isLactoseFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: const Row(
                children: [
                  Icon(
                    Icons.fastfood_outlined,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Your Meal \nYour Choice',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
          Column(
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
              SwitchListTile(
                title: const Text(
                  'Lactose-Free',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only include lactose-free meals'),
                value: _isLactoseFree,
                activeColor: AppColors.hColor,
                onChanged: (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: const Text(
                  'Vegan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only include vegan meals'),
                value: _isvegan,
                activeColor: AppColors.hColor,
                onChanged: (newValue) {
                  setState(() {
                    _isvegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: const Text(
                  'Vegetarian',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Only include vegetarian meals'),
                value: _isVegetarian,
                activeColor: AppColors.hColor,
                onChanged: (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15, bottom: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          foregroundColor:
                              Colors.white, // Change the text color here
                          backgroundColor: AppColors
                              .hColor, // Change the background color here
                        ),
                        onPressed: () async {
                          ref.read(filtersProvider.notifier).setFilters({
                            Filters.isGlutenFree: _isGlutenFree,
                            Filters.isVegan: _isvegan,
                            Filters.isVegetarian: _isVegetarian,
                            Filters.isLactoseFree: _isLactoseFree,
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Apply Filters',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ])
            ],
          ),
        ],
      ),
    );
  }
}
