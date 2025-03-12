import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });

  final Meal meal;

  final void Function(Meal meal) onSelectedMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shadowColor: Colors.white,
      child: InkWell(
        onTap: () {
          onSelectedMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemTrait(
                                  lable: meal.duration.toString() + " min",
                                  icon: Icons.alarm),
                              MealItemTrait(
                                  lable: complexityText, icon: Icons.work),
                              MealItemTrait(
                                  lable: affordabilityText, icon: Icons.money),
                            ])
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
