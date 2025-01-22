import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/cat_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .1,
          backgroundColor: Colors.black,
          elevation: 10,
          shadowColor: Colors.red,
          centerTitle: true,
          title: const Text(
            "Meals Categories",
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),
        body: GridView(
            padding: EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children:
                //  [availableCategories.map((Category) => CategoryGridItem(category: Category)).toList()]
                [
              for (final Category in availableCategories)
                CategoryGridItem(category: Category)
            ]));
  }
}
