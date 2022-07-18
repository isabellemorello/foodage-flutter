import 'package:flutter/material.dart';
import 'package:foodage_morello/models/labels.dart';

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
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 5),
      child: Card(
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
      ),
    );
  }
}

class ListViewLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
      ],
    );
  }
}
