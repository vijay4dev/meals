import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onToogleFav});

  final Meal meal;
  final void Function(Meal meal)  onToogleFav;

  String get mealname{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get mealprice{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ) ,
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MealDetailScreen(
                onToogleFav: onToogleFav,
                  meal: meal,
              )));
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(meal.imageUrl,),
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title, 
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                            MealItemTrait(icon: Icons.schedule, label: '${meal.duration.toString()} min'),
                            SizedBox(width: 12,),
                            MealItemTrait(icon: Icons.work, label: mealname),
                            SizedBox(width: 12,),
                            MealItemTrait(icon: Icons.attach_money, label: mealprice)
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}