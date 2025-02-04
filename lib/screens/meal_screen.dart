// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    Key? key,
    required this.title,
    required this.meals,
  }) : super(key: key);

  final String title;
  final List<Meal> meals;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          title,
        )),
        body: meals.isEmpty
            ? Center(
                child: Text('Oops..look for another category'),
              )
            : ListView.builder(
                itemCount: meals.length,
                itemBuilder: ((context, index) => MealItem(
                      meal: meals[index],
                      onSelectedMeal: (meal) {
                        selectMeal(meal, context);
                      },
                    ))));
  }
}
