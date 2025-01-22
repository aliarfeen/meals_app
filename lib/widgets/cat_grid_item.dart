// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        category.color.withOpacity(.55),
        category.color.withOpacity(.9),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(category.title),
    );
  }
}
