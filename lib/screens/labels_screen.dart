import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/components/labels_layout/grid_view_label.dart';
import 'package:foodage_morello/components/labels_layout/list_view_label.dart';

class LablesScreen extends StatefulWidget {
  static const String id = 'labels_screen';

  @override
  _LablesScreenState createState() => _LablesScreenState();
}

class _LablesScreenState extends State<LablesScreen> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    // ];
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.label_outline,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Etichette'),
          ],
        ),
        actions: [
          TextButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isList
                    ? Icon(
                        Icons.grid_view,
                        color: Colors.white,
                        size: 20,
                      )
                    : Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 20,
                      ),
                isList
                    ? Text(
                        'Griglia',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      )
                    : Text(
                        'Lista',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
              ],
            ),
            onPressed: () {
              setState(() {
                isList = !isList;
                print(isList);
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: isList ? 30 : 10,
        ),
        color: Colors.teal.shade50,
        child: isList ? ListViewLabel() : GridViewLabel(),
      ),
    );
  }
}
