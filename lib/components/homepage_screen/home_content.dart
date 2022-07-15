import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/screens/section_type_screen_homepage/home_dispensa_screen.dart';
import '/screens/section_type_screen_homepage/home_all_food_screen.dart';
import 'package:foodage_morello/db/firestore_db.dart';
import 'package:foodage_morello/screens/section_type_screen_homepage/home_fridge_screen.dart';
import 'package:foodage_morello/screens/section_type_screen_homepage/home_freezer_screen.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<String?> typeContainerFood = [
    'Tutti',
    'Frigo',
    'Freezer',
    'Dispensa',
  ];
  final FoodCard newFood = FoodCard(
    sectionIcon: kFreezerIcon,
    foodName: 'Cavolo',
    deadlineDate: '22/08/2022',
  );
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoodListSections>(
      create: (context) => FoodListSections(),
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          // leading: TextButton(
          //   child: Icon(
          //     Icons.dehaze,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
          title: Text('Homepage'),
          centerTitle: true,
          actions: [
            TextButton(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Provider.of<FoodListSections>(context, listen: false)
                    .addNewCardToTheList(newFood);
                print('added from search');
                //!
                // FoodDBWorker().logOutUser(context);
                // lista.add(Text('data4'));
                // print('added');
                // FoodListSections().freezerExpiredFood.add(newFood
                //     // FoodCard(
                //     //   sectionIcon: kFreezerIcon,
                //     //   foodName: 'Cavolo',
                //     //   deadlineDate: '22/08/2022',
                //     // ),
                //     );
                // print('${FoodListSections().freezerExpiredFood} added');

                // SnackBar(
                //   content: Text('Added'),
                //   backgroundColor: Colors.amber,
                // );
                // FoodListSections().addNewCardToTheList(newCard);
              },
            ),
          ],
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 11),
            tabs: [
              Tab(
                icon: Image.asset(
                  'images/logo.png',
                  width: 30,
                  color: Colors.red.shade100,
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
          child: Icon(
            Icons.add,
            color: Colors.teal,
          ),
          elevation: 4.0,
          onPressed: () {
            Navigator.pushNamed(context, NewFoodScreen.id);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: TabBarView(
          children: [
            HomeAllFoodScreen(),
            FridgeHomeScreen(),
            FreezerHomeScreen(),
            DispensaHomeScreen(),
          ],
        ),
      ),
    );
  }
}
