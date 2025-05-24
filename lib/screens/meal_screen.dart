import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meal, required this.onToogleFav});
  
  final String title;
  final List<Meal> meal;

  final void Function(Meal meal)  onToogleFav;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
    itemCount: meal.length,
      itemBuilder: (ctx,index) => MealItem(meal: meal[index], onToogleFav: onToogleFav,)
      );
    Widget Fallback  = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Uhh... oh okay nothing is here",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
          SizedBox(height: 18,),
          Text("Try to search from diffrent category", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),)
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meal.isEmpty ? Fallback : content ,
    );
  }
}