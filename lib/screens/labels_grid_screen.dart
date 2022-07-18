import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/labels.dart';

class LabelsGridScreen extends StatefulWidget {
  static const String id = 'labels_grid_screen';

  @override
  _LabelsGridScreenState createState() => _LabelsGridScreenState();
}

class _LabelsGridScreenState extends State<LabelsGridScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.teal.shade50,
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        // mainAxisSpacing: 5,
        // crossAxisSpacing: 5,
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
      ),
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
