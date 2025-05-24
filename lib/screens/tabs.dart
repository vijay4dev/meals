import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedpageindex = 0;

  final List<Meal> _favmeal=[];

  void showmessage(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text(msg))
    );
  }

  void _togglefavmeal(Meal meal){
    final isexist = _favmeal.contains(meal);

    if(isexist){
      setState(() {
        _favmeal.remove(meal);
      });
      showmessage('you just removed this meal from faviourate');
    }
    else {
      setState(() {
        _favmeal.add(meal);
      });
      showmessage('you just added this meal to faviourate');
      
    }
      
  }

  void selectpage(index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepages = CategoriesScreen(onToogleFav: _togglefavmeal,);
    var activepagetitle = "Categories";

    if (_selectedpageindex == 1) {
      activepages = MealScreen(title: 'Faviourates', meal: _favmeal, onToogleFav: _togglefavmeal,);
      activepagetitle = 'Faviourates';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activepagetitle)),
      body: activepages,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectpage(index);
        },
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'faviourates'),
        ],
      ),
    );
  }
}
