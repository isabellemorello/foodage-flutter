import 'package:flutter/material.dart';
import 'package:foodage_morello/components/home_content.dart';

class HomepageScreen extends StatelessWidget {
  static const String id = 'homepage_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: MyScaffold());
  }
}

class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
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
      // body: Center(
      //   child: screens,
      // ),
      // floatingActionButton: floatActBut(currentScreen),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
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
            setState(() {
              currentScreen = inIndex;
            });
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

// FloatingActionButton floatActBut(int stateScreen) {
//   if (stateScreen == 0 || stateScreen == 1) {
//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       elevation: 4.0,
//       onPressed: () {},
//     );
//   } else {
//     return FloatingActionButton(
//       backgroundColor: Colors.purple,
//       child: Icon(Icons.delete),
//       elevation: 4.0,
//       onPressed: () {},
//     );
//   }
// }

// Container(
// color: Colors.teal,
// child:  Row(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// IconButton(
// icon: Icon(
// Icons.home,
// color: Colors.white,
// ),
// onPressed: () {},
// ),
// IconButton(
// icon: Icon(
// Icons.delete,
// color: Colors.white,
// ),
// onPressed: () {},
// ),
// IconButton(
// icon: Icon(
// Icons.settings,
// color: Colors.white,
// ),
// onPressed: () {},
// ),
// IconButton(
// icon: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 10.0,
// ),
// onPressed: () {},
// ),
// ],
// ),
// ),
