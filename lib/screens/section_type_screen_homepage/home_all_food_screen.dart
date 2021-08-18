import 'package:flutter/material.dart';

class HomeAllFoodScreen extends StatelessWidget {
  const HomeAllFoodScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          // TODO: fare una lista di card
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
    );
  }
}
