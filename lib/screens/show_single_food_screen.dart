import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:provider/provider.dart';

class ShowSingleFoodScreen extends StatelessWidget {
  static const String id = 'show_single_food_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListSections>(
        builder: (context, foodListSections, child) {
      return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          leading: TextButton(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Indietro',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              '${foodListSections.freezerExpiredFood[0].foodName}',
            ),
          ),
          actions: [
            TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.mode,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Modifica',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                kFeatureNotDeveloped(context);
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.teal.shade50,
          padding: EdgeInsets.only(top: 20, right: 30, left: 30),
          child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 40,
                child: Icon(
                  kFridgeIcon,
                  size: 50,
                  color: Colors.red.shade100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data di scadenza',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Text(foodListSections.freezerExpiredFood[0].deadlineDate
                      .toString()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tipo di scadenza',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Text('Scadenza a breve termine'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sezione',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Text('Frigo'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Etichette',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Chip(
                    label: Text('🥦 Verdura'),
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.teal,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nome del negozio',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Text('Bel negozio'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prezzo',
                    style: kTitleSmallerTextStyle(),
                  ),
                  Text('27,89'),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
