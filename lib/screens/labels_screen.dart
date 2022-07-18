import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/labels.dart';
import 'package:foodage_morello/screens/labels_grid_screen.dart';

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
                Expanded(
                  flex: 1,
                  child: isList
                      ? Icon(
                          Icons.grid_view,
                          color: Colors.white,
                          size: 20,
                        )
                      : Icon(
                          Icons.drag_handle_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                ),
                Expanded(
                  flex: 1,
                  child: isList
                      ? Text(
                          'Griglia',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      : Text(
                          'Lista',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
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

class ListViewLabelCard extends StatelessWidget {
  ListViewLabelCard(
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

class ListViewLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListViewLabelCard(
          iconLabel: labels[0].icon.toString(),
          nameLabel: labels[0].name.toString(),
          numberLabel: '1'),
      ListViewLabelCard(
          iconLabel: labels[1].icon.toString(),
          nameLabel: labels[1].name.toString(),
          numberLabel: '2'),
      ListViewLabelCard(
          iconLabel: labels[2].icon.toString(),
          nameLabel: labels[2].name.toString(),
          numberLabel: '1'),
      ListViewLabelCard(
          iconLabel: labels[3].icon.toString(),
          nameLabel: labels[3].name.toString(),
          numberLabel: '3'),
      ListViewLabelCard(
          iconLabel: labels[4].icon.toString(),
          nameLabel: labels[4].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[5].icon.toString(),
          nameLabel: labels[5].name.toString(),
          numberLabel: '1'),
      ListViewLabelCard(
          iconLabel: labels[6].icon.toString(),
          nameLabel: labels[6].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[7].icon.toString(),
          nameLabel: labels[7].name.toString(),
          numberLabel: '1'),
      ListViewLabelCard(
          iconLabel: labels[8].icon.toString(),
          nameLabel: labels[8].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[9].icon.toString(),
          nameLabel: labels[9].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[10].icon.toString(),
          nameLabel: labels[10].name.toString(),
          numberLabel: '2'),
      ListViewLabelCard(
          iconLabel: labels[11].icon.toString(),
          nameLabel: labels[11].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[12].icon.toString(),
          nameLabel: labels[12].name.toString(),
          numberLabel: '1'),
      ListViewLabelCard(
          iconLabel: labels[13].icon.toString(),
          nameLabel: labels[13].name.toString(),
          numberLabel: '0'),
      ListViewLabelCard(
          iconLabel: labels[14].icon.toString(),
          nameLabel: labels[14].name.toString(),
          numberLabel: '0'),
    ]);
  }
}

class GridViewLabel extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 30),
      children: [
        LabelGridCard(
            iconLabel: labels[0].icon.toString(),
            nameLabel: labels[0].name.toString(),
            numberLabel: '1'),
        LabelGridCard(
            iconLabel: labels[1].icon.toString(),
            nameLabel: labels[1].name.toString(),
            numberLabel: '2'),
        LabelGridCard(
            iconLabel: labels[2].icon.toString(),
            nameLabel: labels[2].name.toString(),
            numberLabel: '1'),
        LabelGridCard(
            iconLabel: labels[3].icon.toString(),
            nameLabel: labels[3].name.toString(),
            numberLabel: '3'),
        LabelGridCard(
            iconLabel: labels[4].icon.toString(),
            nameLabel: labels[4].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[5].icon.toString(),
            nameLabel: labels[5].name.toString(),
            numberLabel: '1'),
        LabelGridCard(
            iconLabel: labels[6].icon.toString(),
            nameLabel: labels[6].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[7].icon.toString(),
            nameLabel: labels[7].name.toString(),
            numberLabel: '1'),
        LabelGridCard(
            iconLabel: labels[8].icon.toString(),
            nameLabel: labels[8].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[9].icon.toString(),
            nameLabel: labels[9].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[10].icon.toString(),
            nameLabel: labels[10].name.toString(),
            numberLabel: '2'),
        LabelGridCard(
            iconLabel: labels[11].icon.toString(),
            nameLabel: labels[11].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[12].icon.toString(),
            nameLabel: labels[12].name.toString(),
            numberLabel: '1'),
        LabelGridCard(
            iconLabel: labels[13].icon.toString(),
            nameLabel: labels[13].name.toString(),
            numberLabel: '0'),
        LabelGridCard(
            iconLabel: labels[14].icon.toString(),
            nameLabel: labels[14].name.toString(),
            numberLabel: '0'),
      ],
      //
    );
  }
}

class LabelGridCard extends StatelessWidget {
  LabelGridCard(
      {required this.iconLabel,
      required this.nameLabel,
      required this.numberLabel});

  final String iconLabel;
  final String nameLabel;
  final String numberLabel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => kFeatureNotDeveloped(context),
      child: Card(
        color: Colors.red.shade50,
        elevation: 1,
        shadowColor: Colors.teal,
        child: Container(
          height: 140,
          width: 140,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: Text(iconLabel),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                nameLabel,
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              SizedBox(
                height: 8,
              ),
              Text(numberLabel),
            ],
          ),
        ),
      ),
    );
  }
}
