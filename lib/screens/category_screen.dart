import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/cat_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
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
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * .13,
          backgroundColor: Colors.black87,
          elevation: 2,
          shadowColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Choose a category",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
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
