import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/components/labels_layout/grid_view_label.dart';
import 'package:foodage_morello/components/labels_layout/list_view_label.dart';
import 'package:provider/provider.dart';

class LablesScreen extends StatefulWidget {
  static const String id = 'labels_screen';

  @override
  _LablesScreenState createState() => _LablesScreenState();
}

class _LablesScreenState extends State<LablesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
      builder: (context, foodListProvider, child) {
        bool isListLabel = foodListProvider.isListLabel;
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
                    isListLabel
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
                    isListLabel
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
                    isListLabel = !isListLabel;
                  });
                  Provider.of<FoodListProvider>(context, listen: false)
                      .setIsListLabel();
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: isListLabel ? 20 : 10,
            ),
            color: Colors.teal.shade50,
            child: isListLabel ? ListViewLabel() : GridViewLabel(),
          ),
        );
      },
    );
  }
}
