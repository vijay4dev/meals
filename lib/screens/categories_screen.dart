import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pick your category',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 20, mainAxisSpacing: 20),        
        children: [
          for(final category in availableCategories ) 
            CategoryGridItem(category: category)
        ],
      ),
    );
  }
}