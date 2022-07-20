import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/components/settings_components.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';
import 'package:foodage_morello/db/firestore_db.dart';
import 'package:image_picker/image_picker.dart';

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
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Impostazioni'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
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
                            icon: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.teal.shade50,
                                size: 20,
                              ),
                            ),
                            onPressed: () => kDialogCaptureImage(context),
                          ),
                        ),
                      ],
                    )
                  : ProfileCircleAvatar(),

              // TODO: qui modificare
              onPressed: () {
                setState(() {
                  kDialogCaptureImage(context);
                });
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _userName,
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
                  TextButton(
                    child: Text(
                      'Cambia Password',
                    ),
                    style: ButtonStyle(),
                    onPressed: () => kDialogFeatureNotDeveloped(context),
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
                  ),
                  Divider(),
                  NotificationBySection(
                    text: 'Freezer',
                  ),
                  Divider(),
                  NotificationBySection(
                    text: 'Dispensa',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'PRODOTTI SENZA SCADENZA',
                  style: kUpperCaseTextStyle,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      kDialogSettingsInfoDeadlineType(context);
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
              'Prodotti senza scadenza, ma a lungo termine',
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
                        'Imposta come limite massimo di 14 giorni per la scadenza'),
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
    );
  }

  /// funzioni "capture" e "pickImage" per selezionare la foto di profilo
  Future kDialogCaptureImage(BuildContext context) async {
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
                kDialogPickImage(ImageSource.camera);
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
                kDialogPickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      routeSettings: RouteSettings(arguments: this),
    );
  }

  /// funzioni "capture" e "pickImage" per selezionare la foto di profilo
  Future kDialogPickImage(ImageSource source) async {
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
}
