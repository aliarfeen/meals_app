import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_provider.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var selectedIndex = 0;

  @override
  void _tabbed(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _favMeals = ref.watch(favoriteMealProvider);
    Widget activePage = CategoriesScreen();
    if (selectedIndex == 1) {
      activePage = MealScreen(title: 'Fav', meals: _favMeals);
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.hColor,
        currentIndex: selectedIndex,
        onTap: _tabbed,
        selectedItemColor: AppColors.secondaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline), label: 'favorites'),
        ],
      ),
    );
  }
}
