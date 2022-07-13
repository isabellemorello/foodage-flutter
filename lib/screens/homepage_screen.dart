import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/components/homepage_screen/home_content.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/screens/handler_home_screen.dart';
import 'package:foodage_morello/screens/settings_screen.dart';
import 'package:foodage_morello/screens/trash_screen.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/models/food_list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodage_morello/db/firestore_db.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

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
  final _auth = FirebaseAuth.instance;
  var currentScreen = 0;
  var screens = [
    HomeContent(),
    TrashScreen(),
    SettingsScreen(),
    HandlerHomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: foodsModel,
      child: Scaffold(
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
