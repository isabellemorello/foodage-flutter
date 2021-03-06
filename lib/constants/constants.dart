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
TextStyle kUpperCaseTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black38,
);

class KShadowedContainer extends StatefulWidget {
  KShadowedContainer(
      {required this.child, this.padding, this.margin, this.color});
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;

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
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

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

kLabelButton({required String icon, required text, onPressed}) {
  final color = Colors.teal.shade50;

  return TextButton(
    onPressed: onPressed,
    child: Column(
      children: [
        Text(
          icon,
          style: TextStyle(color: color),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: TextStyle(color: color),
        ),
      ],
    ),
  );
}

/// Per la lista nel drawer
Widget kBuildMenuItem({
  required String text,
  required dynamic icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.teal.shade50;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

/// Per il titolo delle card nella visualizzazione a griglia
TextStyle kTitleTextStyle() {
  return TextStyle(
    color: Colors.teal.shade600,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

/// Per il testo delle card nella visualizzazione a griglia
TextStyle kTitleSmallerTextStyle() {
  return TextStyle(
    color: Colors.teal.shade600,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}
