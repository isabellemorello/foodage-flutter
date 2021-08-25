import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'package:foodage_morello/constants/constants.dart';
import '/screens/section_type_screen_homepage/home_all_food_screen.dart';

class HomeContent extends StatelessWidget {
  List<String?> typeContainerFood = [
    'Tutti',
    'Frigo',
    'Freezer',
    'Dispensa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Icon(
            Icons.dehaze,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Homepage'),
        actions: [
          TextButton(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 11),
          tabs: [
            Tab(
              icon: Image.asset(
                'images/logo3.png',
                width: 30,
                color: Colors.tealAccent,
              ),
              text: typeContainerFood[0],
            ),
            Tab(
              icon: Icon(kFridgeIcon),
              text: typeContainerFood[1],
            ),
            Tab(
              icon: Icon(kFreezerIcon),
              text: typeContainerFood[2],
            ),
            Tab(
              icon: Icon(kDispensaIcon),
              text: typeContainerFood[3],
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal[50],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 4.0,
        onPressed: () {
          Navigator.pushNamed(context, NewFoodScreen.id);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: TabBarView(
        children: [
          HomeAllFoodScreen(),
          HomeAllFoodScreen(),
          HomeAllFoodScreen(),
          HomeAllFoodScreen(),
        ],
      ),
    );
  }
}
