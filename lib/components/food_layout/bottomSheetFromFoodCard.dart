import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';

Future<dynamic> bottomSheetFromFoodCard(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 20.0, bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: Colors.teal[600],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aggiungi in'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.teal.shade50,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Column(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.teal.shade50,
                        ),
                        Text(
                          'Fatto',
                          style: TextStyle(
                              fontSize: 10, color: Colors.teal.shade50),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            kBuildMenuItem(
                text: 'Scaduto',
                icon: Icons.sentiment_very_dissatisfied,
                onClicked: () {
                  kDialogFeatureNotDeveloped(context);
                }),
            kBuildMenuItem(
                text: 'Preferiti',
                icon: Icons.star,
                onClicked: () {
                  kDialogFeatureNotDeveloped(context);
                }),
            kBuildMenuItem(
                text: 'Spesa',
                icon: Icons.shopping_cart_sharp,
                onClicked: () {
                  kDialogFeatureNotDeveloped(context);
                }),
            kBuildMenuItem(
                text: 'Cucinato da me',
                icon: Icons.restaurant,
                onClicked: () {
                  kDialogFeatureNotDeveloped(context);
                }),
            kBuildMenuItem(
                text: 'Cestino',
                icon: Icons.delete_sharp,
                onClicked: () {
                  kDialogFeatureNotDeveloped(context);
                }),
          ],
        ),
      ),
    ),
  );
}
