import 'package:flutter/material.dart';
import 'package:foodage_morello/components/home_content.dart';
import 'package:foodage_morello/models/food_model.dart';
import 'package:foodage_morello/models/screens_model.dart';
import 'package:provider/provider.dart';
import 'new_food_screen.dart';
import 'package:foodage_morello/models/screens_model.dart';

class HomepageScreen extends StatelessWidget {
  static const String id = 'homepage_screen';

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(length: 4, child: MyScaffold());

    return ChangeNotifierProvider.value(
      value: screenModel,
      child: Consumer<ScreenModel>(
        builder: (context, screenModel, child) {
          return IndexedStack(
            index: screenModel.currentScreenState,
            children: [
              DefaultTabController(length: 4, child: MyScaffold()),
              NewFoodScreen(),
            ],
          );
        },
      ),
    );
  }
}

//
class MyScaffold extends StatelessWidget {
  var currentScreen = 0;
  var screens = [
    HomeContent(),
    Text('Screen 1: Birthday'),
    Text('Screen 2: Data'),
    MoreButtons(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: screens.elementAt(currentScreen),
        color: Colors.teal[50],
      ),
      bottomNavigationBar: BottomAppBar(
        //TODO: wrappare dentro Consumer la BottomNavigationBar
        child: Consumer<ScreenModel>(
          builder: (context, screenModel, child) {
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.teal,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delete),
                  label: 'Cestino',
                  backgroundColor: Colors.teal,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Impostazioni',
                  backgroundColor: Colors.teal,
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10.0,
                  ),
                  label: 'Casa',
                  backgroundColor: Colors.teal,
                ),
              ],
              currentIndex: currentScreen,
              onTap: (int inIndex) {
                screenModel.setScreen(inIndex);
                // currentScreen = inIndex;
              },
            );
          },
        ),
      ),
    );
  }
}

class MoreButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 20,
                  ),
                  Text(
                    'Statistic',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
