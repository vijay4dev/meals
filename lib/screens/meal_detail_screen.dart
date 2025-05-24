import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToogleFav});

  final Meal meal;

  final void Function(Meal meal)  onToogleFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),actions: [
        IconButton(onPressed: (){
          onToogleFav(meal);
        }, icon: Icon(Icons.star))
      ],),
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(height: 14),
            Text(
              '  Ingredients',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                shrinkWrap: true, // Add this to prevent ListView from taking infinite height
                physics: NeverScrollableScrollPhysics(), // Disable scrolling for ListView
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Text(
                    "- ${meal.ingredients[index]}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  );
                },
              ),
            ),
            SizedBox(height: 0),
            Text(
              '  Steps',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15 , right: 10),
              child: ListView.builder(
                shrinkWrap: true, // Add this to prevent ListView from taking infinite height
                physics: NeverScrollableScrollPhysics(), // Disable scrolling for ListView
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Text(
                    "- ${meal.steps[index]} ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}