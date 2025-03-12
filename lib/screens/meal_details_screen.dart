import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_provider.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  IconData favIcon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isFaved = ref
                  .read(favoriteMealProvider.notifier)
                  .toggleFavMeal(widget.meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColors.hColor,
                  width: MediaQuery.of(context).size.width * 0.8,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  content: Center(
                    child: Text(
                      isFaved ? 'Added to favorite' : 'Removed from favorite',
                      style: TextStyle(fontSize: 30),
                    ),
                  )));

              setState(() {
                favIcon = isFaved ? Icons.star : Icons.star_border;
              });
            },
            icon: Icon(favIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              widget.meal.imageUrl,
              height: 270,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Text(
              'Ingredients',
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
            ),
            Column(
              children: widget.meal.ingredients
                  .map((ingredient) => Text(ingredient))
                  .toList(),
            ),
            Text(
              'Steps',
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.meal.steps
                  .map((step) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                        child: Text(
                          step,
                          textAlign: TextAlign.center,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
