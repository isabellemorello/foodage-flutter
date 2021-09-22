import 'dart:io';
// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
// import 'package:foodage_morello/components/homepage_screen/home_content.dart';
import 'package:foodage_morello/components/settings_components.dart';
import 'package:foodage_morello/constants/constants.dart';
// import 'package:foodage_morello/screens/trash_screen.dart';
import 'package:foodage_morello/db/firestore_db.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

TextEditingController _userName = TextEditingController();
// TextEditingController _userEmail = TextEditingController();
late User loggedInUser;

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';

  @override
  Widget build(BuildContext context) => MySettingsScaffold();
  // DefaultTabController(length: 4, child: MySettingsScaffold());
}

class MySettingsScaffold extends StatefulWidget {
  const MySettingsScaffold({Key? key}) : super(key: key);

  @override
  _MySettingsScaffoldState createState() => _MySettingsScaffoldState();
}

class _MySettingsScaffoldState extends State<MySettingsScaffold> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  bool memberSwitched = false;
  bool shortTermSwitched = false;
  bool longTermSwitched = false;
  Color selectedColorShortTerm = Colors.teal;
  Color selectedColorLongTerm = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // var currentScreen = 0;
    // var screens = [
    //   HomeContent(),
    //   TrashScreen(),
    //   SettingsScreen(),
    //   Text('Gestione Case'),
    // ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Impostazioni'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        // child: screens.elementAt(currentScreen),
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        color: Colors.teal.shade50,
        child: ListView(
          children: [
            Text(
              'PROFILO',
              style: kUpperCaseTextStyle,
            ),
            TextButton(
              child: image != null
                  ? Stack(
                      children: [
                        ClipOval(
                          child: Image.file(
                            image!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            // iconSize: ,
                            icon: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.teal.shade50,
                                size: 20,
                              ),
                            ),
                            onPressed: () => capture(context),
                          ),
                        ),
                      ],
                    )
                  : ProfileCircleAvatar(),

              // TODO: qui modificare
              onPressed: () {
                setState(() {
                  capture(context);
                });
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _userName,
                    textAlign: TextAlign.center, //! non funziona
                    decoration: InputDecoration(
                      labelText: 'Nome Utente',
                      hintText: 'Nome Utente',
                      hintStyle: TextStyle(color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '${loggedInUser.email}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Spacer(),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.teal.shade50,
                          ),
                        ),
                        onPressed: () => FoodDBWorker().logOutUser(context),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  TextButton(
                    child: Text(
                      'Cambia Password',
                    ),
                    style: ButtonStyle(),
                    onPressed: () => kFeatureNotDeveloped(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                        'Visualizza i nomi degli altri membri quando scorri le liste'),
                  ),
                ),
                // Spacer(),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: memberSwitched,
                    onChanged: (value) {
                      setState(() {
                        memberSwitched = value;
                        print(memberSwitched);
                      });
                    },
                    activeTrackColor: Colors.teal,
                    activeColor: Colors.teal.shade100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'PROMEMORIA',
              style: kUpperCaseTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Puoi personalizzare i Promemoria per ogni sezione',
            ),
            KShadowedContainer(
              padding: EdgeInsets.only(left: 20, right: 10),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: [
                  NotificationBySection(
                    text: 'Frigo',
                    onPressed: () {},
                  ),
                  Divider(),
                  NotificationBySection(
                    text: 'Freezer',
                    onPressed: () {},
                  ),
                  Divider(),
                  NotificationBySection(
                    text: 'Dispensa',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //TODO:
                Text(
                  'PRODOTTI SENZA SCADENZA',
                  style: kUpperCaseTextStyle,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (_) => DeadlineFreeAlertDialog());
                    });
                  },
                  icon: KShadowedContainerCircular(
                    child: Icon(
                      Icons.info,
                      color: Colors.teal.shade50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Prodotti senza scadenza, ma a breve termine',
            ),
            KShadowedContainer(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Evidenzia i prodotti con scadenza a breve termine con un altro colore'),
                    trailing: TextButton(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: selectedColorShortTerm,
                      ),
                      onPressed: () => PickColor(
                              onColorChanged: (color) => setState(
                                  () => this.selectedColorShortTerm = color))
                          .pickColor(context),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                        'Imposta come limite massimo di 7 giorni per la scadenza'),
                    trailing: Switch(
                      value: shortTermSwitched,
                      onChanged: (value) {
                        setState(() {
                          shortTermSwitched = value;
                          print(shortTermSwitched);
                        });
                      },
                      activeTrackColor: Colors.teal,
                      activeColor: Colors.teal.shade100,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Prodotti senza scadenza, ma a medio termine',
            ),
            KShadowedContainer(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        'Evidenzia i prodotti con scadenza a medio termine con un altro colore'),
                    trailing: TextButton(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: selectedColorLongTerm,
                      ),
                      onPressed: () => PickColor(
                              onColorChanged: (color) => setState(
                                  () => this.selectedColorLongTerm = color))
                          .pickColor(context),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                        'Imposta come limite massimo di 7 giorni per la scadenza'),
                    trailing: Switch(
                      value: longTermSwitched,
                      onChanged: (value) {
                        setState(() {
                          longTermSwitched = value;
                          print(longTermSwitched);
                        });
                      },
                      activeTrackColor: Colors.teal,
                      activeColor: Colors.teal.shade100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: BottomNavigationBar(
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           icon: Icon(kHomeIcon),
      //           label: 'Home',
      //           backgroundColor: Colors.teal,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(kDeleteIcon),
      //           label: 'Cestino',
      //           backgroundColor: Colors.teal,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(kSettingsIcon),
      //           label: 'Impostazioni',
      //           backgroundColor: Colors.teal,
      //         ),
      //         BottomNavigationBarItem(
      //           icon: CircleAvatar(
      //             backgroundColor: Colors.white,
      //             radius: 10.0,
      //           ),
      //           label: 'Casa',
      //           backgroundColor: Colors.teal,
      //         ),
      //       ],
      //       currentIndex: currentScreen,
      //       onTap: (int inIndex) {
      //         setState(() {
      //           currentScreen = inIndex;
      //         });
      //       }),
      // ),
    );
  }

  Future capture(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal.shade50,
        title: Text('Seleziona foto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                'Da Fotocamera',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(Icons.photo_camera),
              onTap: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                'Da Galleria',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(Icons.image),
              onTap: () {
                pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      routeSettings: RouteSettings(arguments: this),
    );
  }

  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      // final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');

  //   return File(image.path).copy(image.path);
  // }
}
