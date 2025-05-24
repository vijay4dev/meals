import 'package:flutter/material.dart';
import 'package:meals/models/categorymodels.dart';
import 'package:meals/screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onselctcategory});

  final Category category;

  final void Function() onselctcategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepOrangeAccent,
      borderRadius:  BorderRadius.circular(10),
      onTap: () {
        onselctcategory();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(
          category.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          )
        ),
      ),
    );
  }
}