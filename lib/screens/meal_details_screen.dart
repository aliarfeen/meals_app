import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            meal.imageUrl,
            height: 270,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Text(
            'Ingrediants',
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
          Column(
            children:
                meal.ingredients.map((ingrediant) => Text(ingrediant)).toList(),
          ),
          Text(
            'Steps',
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: meal.steps
                .map((ingrediant) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    child: Text(
                      ingrediant,
                      textAlign: TextAlign.center,
                    )))
                .toList(),
          ),
        ],
      )),
    );
  }
}
