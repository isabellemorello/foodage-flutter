import 'package:flutter/material.dart';

// Utilizzati in new_food_screen
Color kInactiveColorSectionType = Colors.teal.shade50;
const Color kActiveColorSectionType = Colors.teal;
const Color kInactiveColorComponentsSectionType = Colors.black;
Color kActiveColorComponentsSectionType = Colors.teal.shade50;

// Icone
const kFrigoIcon = 'images/frigo.png';
const kFridgeIcon = Icons.kitchen;
const kFreezerIcon = Icons.ac_unit_sharp;
const kDispensaIcon = Icons.free_breakfast;
const kHomeIcon = Icons.home;
const kDeleteIcon = Icons.delete;
const kSettingsIcon = Icons.settings;

// TextStyle
const kUpperCaseTextStyle = TextStyle(
  fontSize: 16,
  // fontWeight: FontWeight.bold,
  color: Colors.black38,
);

Future<dynamic> kFeatureNotDeveloped(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(
              'Questa feature non è stata ancora implementata.',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'))
            ],
          ));
}

class KShadowedContainer extends StatefulWidget {
  KShadowedContainer(
      {required this.child, this.padding, this.margin, this.color});
  Widget child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  Color? color;

  @override
  _KShadowedContainerState createState() => _KShadowedContainerState();
}

class _KShadowedContainerState extends State<KShadowedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.color == null ? Colors.teal.shade50 : widget.color,
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade200.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: widget.child,
    );
  }
}

// Container per icone piccole circolari
class KShadowedContainerCircular extends StatefulWidget {
  KShadowedContainerCircular({required this.child, this.padding, this.margin});
  Widget child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;

  @override
  _KShadowedContainerCircularState createState() =>
      _KShadowedContainerCircularState();
}

class _KShadowedContainerCircularState
    extends State<KShadowedContainerCircular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 8,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
