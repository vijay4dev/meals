import 'package:flutter/material.dart';

enum Filter{
  glutenFree,lactoseFree,vegetarian,vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentfilters});

  final Map<Filter , bool> currentfilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenfreemeals = false;
  var _lactosfree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenfreemeals = widget.currentfilters[Filter.glutenFree]!;
    _lactosfree = widget.currentfilters[Filter.lactoseFree]!;
    _vegan = widget.currentfilters[Filter.vegan]!;
    _vegetarian = widget.currentfilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if(!didPop){
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenfreemeals,
            Filter.lactoseFree: _lactosfree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });  
          }
          else{
            return;
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreemeals,
              onChanged: (value) {
                setState(() {
                  _glutenfreemeals = value;
                });
              },
              title: const Text('Gluten-free'),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
            ),
            SwitchListTile(
              value: _lactosfree,
              onChanged: (value) {
                setState(() {
                  _lactosfree = value;
                });
              },
              title: const Text('Lactose-free'),
              subtitle: Text(
                'Only include Lactos free meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (value) {
                setState(() {
                  _vegetarian = value;
                });
              },
              title: const Text('Vegetarian'),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (value) {
                setState(() {
                  _vegan = value;
                });
              },
              title: const Text('Vegan'),
              subtitle: Text(
                'Only include Vegan meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      )
    );
  }
}