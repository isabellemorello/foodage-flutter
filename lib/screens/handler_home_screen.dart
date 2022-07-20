import 'package:flutter/material.dart';
import 'package:foodage_morello/components/handler_home_components.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';
import 'package:foodage_morello/screens/handler_home_settings_screen.dart';

class HandlerHomeScreen extends StatelessWidget {
  static const String id = 'handler_home_screen';

  @override
  Widget build(BuildContext context) {
    return HandlerHomeScaffold();
  }
}

class HandlerHomeScaffold extends StatefulWidget {
  @override
  _HandlerHomeScaffoldState createState() => _HandlerHomeScaffoldState();
}

class _HandlerHomeScaffoldState extends State<HandlerHomeScaffold> {
  @override
  Widget build(BuildContext context) {
    int membersNumber = 4;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.teal,
        ),
        onPressed: () {
          kDialogFeatureNotDeveloped(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Le mie Case'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.teal.shade50,
            ),
            onPressed: () => kDialogHandlerHomeScreen(context),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        color: Colors.teal.shade50,
        child: ListView(
          children: [
            IntrinsicHeight(
              child: KShadowedContainer(
                padding: EdgeInsets.fromLTRB(5, 20, 15, 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.image_outlined,
                          size: 100,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.teal,
                    ),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Casa 1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 15.0),
                                      child: membersNumber == 1
                                          ? Text('$membersNumber membro')
                                          : Text('$membersNumber membri'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: membersNumber > 3
                                      ? membersHome(3)
                                      : membersHome(membersNumber),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.teal.shade50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, HandlerHomeSettingsScreen.id);
                                },
                              ),
                            ),
                          ),
                          membersNumber > 3
                              ? Positioned(
                                  bottom: 31,
                                  right: 4,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                  ),
                                )
                              : Positioned(
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  moreThanThreeMembers() {
    Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(
              Icons.add,
              color: Colors.red.shade100,
            )),
      ],
    );
  }
}
