import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key, required this.onselectscreen});
  final void Function(String identifier) onselectscreen;
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).colorScheme.onSecondary,
              child: Text(
                'Cooking Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Meals'),
              onTap: () {
                widget.onselectscreen('Meals');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filters'),
              onTap: () {
                  widget.onselectscreen('Filters');
                },
            ),
          ],
        ),
      );
  }
}