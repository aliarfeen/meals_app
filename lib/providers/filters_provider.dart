import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters {
  isGlutenFree,
  isVegan,
  isVegetarian,
  isLactoseFree,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.isGlutenFree: false,
          Filters.isVegan: false,
          Filters.isVegetarian: false,
          Filters.isLactoseFree: false,
        });
  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void toggleFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());
