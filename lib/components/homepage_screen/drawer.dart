import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/screens/handler_home_screen.dart';
import 'package:foodage_morello/screens/homepage_screen.dart';
import 'package:foodage_morello/screens/labels_screen.dart';
import 'package:foodage_morello/screens/settings_screen.dart';
import 'package:foodage_morello/screens/trash_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.teal.shade600,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/logo.png',
                      height: 40.0,
                      color: Colors.red.shade100 // Color(0xFFce3a55),
                      ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'FOODAGE',
                    style: TextStyle(
                        fontFamily: 'PatrickHand',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.teal.shade50),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Liste'.toUpperCase(),
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kBuildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            kBuildMenuItem(
              text: 'Scaduto',
              icon: Icons.sentiment_very_dissatisfied,
              onClicked: () => kFeatureNotDeveloped(context),
            ),
            kBuildMenuItem(
              text: 'Preferiti',
              icon: Icons.star,
              onClicked: () => kFeatureNotDeveloped(context),
            ),
            kBuildMenuItem(
              text: 'Spesa',
              icon: Icons.shopping_cart_sharp,
              onClicked: () => kFeatureNotDeveloped(context),
            ),
            kBuildMenuItem(
              text: 'Cucinato da me',
              icon: Icons.restaurant,
              onClicked: () => kFeatureNotDeveloped(context),
            ),
            kBuildMenuItem(
              text: 'Cestino',
              icon: Icons.delete_sharp,
              onClicked: () => selectedItem(context, 1),
            ),
            Divider(
              color: Colors.white70,
            ),
            // SizedBox(
            //   height: 20,
            // ),
            ListTile(
              title: Text(
                'Etichette'.toUpperCase(),
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.teal.shade50,
              ),
              onTap: () {
                Navigator.pushNamed(context, LablesScreen.id);
                // kFeatureNotDeveloped(context);
              },
            ),
            HorizontalLablesList(),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.white70,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Preferenze'.toUpperCase(),
                style: TextStyle(
                  color: Colors.teal.shade50,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal.shade50,
                radius: 10.0,
              ),
              title: Text(
                'Gestione Case',
                style: TextStyle(color: Colors.teal.shade50),
              ),
              hoverColor: Colors.white70,
              onTap: () => selectedItem(context, 2),
            ),

            kBuildMenuItem(
              text: 'Impostazioni',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HomepageScreen.id);
        break;
    }
    switch (index) {
      case 1:
        Navigator.pushNamed(context, TrashScreen.id);
        break;
    }
    switch (index) {
      case 2:
        Navigator.pushNamed(context, HandlerHomeScreen.id);
        break;
    }
    switch (index) {
      case 3:
        Navigator.pushNamed(context, SettingsScreen.id);
        break;
    }
  }
}

class HorizontalLablesList extends StatelessWidget {
  const HorizontalLablesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          kLabelButton(
            icon: '🍎',
            text: 'Frutta',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🥦',
            text: 'Verdura',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🍞',
            text: 'Panificazione',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🧀 🥚',
            text: 'Latticini & Uova',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🥩',
            text: 'Carne',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🐟',
            text: 'Pesce',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🛢',
            text: 'Scatolame',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🌿',
            text: 'Condimenti & Spezie',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🥫',
            text: 'Salse & Sughi pronti',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '❄️',
            text: 'Surgelati',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🍝',
            text: 'Pasta',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🍰',
            text: 'Snack & Dolci',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🧃',
            text: 'Bevande',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
          kLabelButton(
            icon: '🐾',
            text: 'Animali',
            onPressed: () => kFeatureNotDeveloped(context),
          ),
        ],
      ),
    );
  }
}
