import 'package:flutter/material.dart';
import 'package:meals_app/data/consts.dart';
import 'package:meals_app/screens/filtters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: const Row(
                children: [
                  Icon(
                    Icons.fastfood_outlined,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Meals App',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 35,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 30),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 35,
            ),
            title: Text(
              'Filters',
              style: TextStyle(fontSize: 30),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FiltterScreen()));
            },
          )
        ],
      ),
    );
  }
}
