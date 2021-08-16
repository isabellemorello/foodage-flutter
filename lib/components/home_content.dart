import 'package:flutter/material.dart';
import 'package:foodage_morello/screens/new_food_screen.dart';

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
          tabs: [
            Tab(
              icon: Image.asset(
                'images/logo.png',
                width: 30,
              ),
              text: typeContainerFood[0],
            ),
            Tab(
              icon: Icon(Icons.cake),
              text: typeContainerFood[1],
            ),
            Tab(
              icon: Icon(Icons.cloud),
              text: typeContainerFood[2],
            ),
            Tab(
              icon: Icon(Icons.home),
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
      body: Container(
        color: Colors.teal[50],
        margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
        child: ListView(
          children: [
            Text('Scaduto'),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('Ciao'),
                trailing: Icon(Icons.delete),
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.photo),
                                title: Text('take a picture'),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.photo),
                                title: Text('from the gallery'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Scade oggi'),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('Ciao'),
                trailing: Icon(Icons.delete),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Scade domani'),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('Ciao'),
                trailing: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
