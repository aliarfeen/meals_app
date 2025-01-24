// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({
    Key? key,
    required this.category,
    required this.function,
  }) : super(key: key);
  final Category category;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(221, 255, 255, 255)),
        ),
      ),
    );
  }
}
