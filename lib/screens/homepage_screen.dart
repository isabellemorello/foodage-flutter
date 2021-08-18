import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/home_content.dart';
import 'package:foodage_morello/constants/constants.dart';

class HomepageScreen extends StatelessWidget {
  static const String id = 'homepage_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: MyScaffold());
  }
}

//
class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  var currentScreen = 0;
  var screens = [
    HomeContent(),
    Center(child: Text('Screen 1: Birthday')),
    Center(child: Text('Screen 2: Data')),
    MoreButtons(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: screens.elementAt(currentScreen),
        color: Colors.teal[50],
      ),
      //
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(kHomeIcon),
                label: 'Home',
                backgroundColor: Colors.teal,
              ),
              BottomNavigationBarItem(
                icon: Icon(kDeleteIcon),
                label: 'Cestino',
                backgroundColor: Colors.teal,
              ),
              BottomNavigationBarItem(
                icon: Icon(kSettingsIcon),
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
              setState(() {
                currentScreen = inIndex;
              });
            }),
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
        ],
      ),
    );
  }
}
