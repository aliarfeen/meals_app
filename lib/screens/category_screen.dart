import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/cat_grid_item.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/rounded_appbar.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  void _selectCategory(BuildContext context, Category category) {
    final dummyMeals = ref.watch(mealsProvider);
    final List<Meal> filteredList = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MealScreen(title: category.title, meals: filteredList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            RoundedAppbar(appBarTitle: 'select a category', context: context),
        drawer: MainDrawer(),
        body: GridView(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children:
                //  [availableCategories.map((Category) => CategoryGridItem(category: Category)).toList()]
                [
              // ignore: non_constant_identifier_names
              for (final category in availableCategories)
                CategoryGridItem(
                    category: category,
                    function: () => _selectCategory(context, category))
            ]));
  }
}
