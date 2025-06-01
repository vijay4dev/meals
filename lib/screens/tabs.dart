import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/meal_screen.dart';

const kinitialfilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedpageindex = 0;

  final List<Meal> _favmeal = [];
  Map<Filter, bool> selctedfilter = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  void showmessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _togglefavmeal(Meal meal) {
    final isexist = _favmeal.contains(meal);

    if (isexist) {
      setState(() {
        _favmeal.remove(meal);
      });
      showmessage('you just removed this meal from faviourate');
    } else {
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

  void setscreen(String identifier) async {
    Navigator.of(context).pop(); // Close the drawer
    print(identifier);
    if (identifier == 'Meals') {
    } else {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FilterScreen(currentfilters:selctedfilter)),
      );
      setState(() {
        selctedfilter = result ?? kinitialfilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals =
        dummyMeals.where((meal) {
          if (selctedfilter[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (selctedfilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (selctedfilter[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          if (selctedfilter[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          return true;
        }).toList();
    Widget activepages = CategoriesScreen(onToogleFav: _togglefavmeal,availablecategory: availablemeals,);
    var activepagetitle = "Categories";

    if (_selectedpageindex == 1) {
      activepages = MealScreen(
        title: '',
        meal: _favmeal,
        onToogleFav: _togglefavmeal,
      );
      activepagetitle = 'Faviourates';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activepagetitle)),
      drawer: MainDrawer(onselectscreen: setscreen),
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
