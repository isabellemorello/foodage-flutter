import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/labels.dart';

class LablesScreen extends StatefulWidget {
  static const String id = 'labels_screen';

  @override
  _LablesScreenState createState() => _LablesScreenState();
}

class _LablesScreenState extends State<LablesScreen> {
  @override
  Widget build(BuildContext context) {
    var listViewLabels = [
      // LabelCard(
      //     iconLabel: Label().labelsList[0].icon.toString(),
      //     nameLabel: Label().labelsList[0].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[1].icon.toString(),
      //     nameLabel: Label().labelsList[1].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[2].icon.toString(),
      //     nameLabel: Label().labelsList[2].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[3].icon.toString(),
      //     nameLabel: Label().labelsList[3].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[4].icon.toString(),
      //     nameLabel: Label().labelsList[4].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[5].icon.toString(),
      //     nameLabel: Label().labelsList[5].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[6].icon.toString(),
      //     nameLabel: Label().labelsList[6].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[7].icon.toString(),
      //     nameLabel: Label().labelsList[7].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[8].icon.toString(),
      //     nameLabel: Label().labelsList[8].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[9].icon.toString(),
      //     nameLabel: Label().labelsList[9].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[10].icon.toString(),
      //     nameLabel: Label().labelsList[10].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[11].icon.toString(),
      //     nameLabel: Label().labelsList[11].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[12].icon.toString(),
      //     nameLabel: Label().labelsList[12].name.toString(),
      //     numberLabel: '1'),
      // LabelCard(
      //     iconLabel: Label().labelsList[13].icon.toString(),
      //     nameLabel: Label().labelsList[13].name.toString(),
      //     numberLabel: '1'),
      LabelCard(iconLabel: '🥦', nameLabel: 'Verdura', numberLabel: '1'),
      LabelCard(iconLabel: '🍞', nameLabel: 'Panificazione', numberLabel: '1'),
      LabelCard(
          iconLabel: '🧀🥚', nameLabel: 'Latticini & Uova', numberLabel: '1'),
      LabelCard(iconLabel: '🥩', nameLabel: 'Carne', numberLabel: '1'),
      LabelCard(iconLabel: '🐟', nameLabel: 'Pesce', numberLabel: '1'),
      LabelCard(iconLabel: '🛢', nameLabel: 'Scatolame', numberLabel: '1'),
      LabelCard(
          iconLabel: '🌿', nameLabel: 'Condimenti & Spezie', numberLabel: '1'),
      LabelCard(
          iconLabel: '🥫', nameLabel: 'Salse & Sughi pronti', numberLabel: '1'),
      LabelCard(iconLabel: '❄️', nameLabel: 'Surgelati', numberLabel: '1'),
      LabelCard(iconLabel: '🍝', nameLabel: 'Pasta', numberLabel: '1'),
      LabelCard(iconLabel: '🍰', nameLabel: 'Snack & Dolci', numberLabel: '1'),
      LabelCard(iconLabel: '🧃', nameLabel: 'Bevande', numberLabel: '1'),
      LabelCard(iconLabel: '🐾', nameLabel: 'Animali', numberLabel: '1'),
    ];
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
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.grid_view,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Griglia',
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
        padding: EdgeInsets.only(top: 20, right: 30, left: 30),
        color: Colors.teal.shade50,
        child: ListView(
          children: listViewLabels,
        ),
      ),
    );
  }
}

class LabelCard extends StatelessWidget {
  LabelCard(
      {required this.iconLabel,
      required this.nameLabel,
      required this.numberLabel});

  final String iconLabel;
  final String nameLabel;
  final String numberLabel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      elevation: 1,
      shadowColor: Colors.teal,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red.shade100,
          child: Text(iconLabel),
        ),
        title: Text(nameLabel),
        trailing: Text(numberLabel),
      ),
    );
  }
}
