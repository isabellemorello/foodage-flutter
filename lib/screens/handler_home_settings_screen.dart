import 'package:flutter/material.dart';
import 'package:foodage_morello/components/handler_home_components.dart';
import 'package:foodage_morello/constants/constants.dart';

class HandlerHomeSettingsScreen extends StatelessWidget {
  static const String id = 'handler_home_settings_screen';

  @override
  Widget build(BuildContext context) => HandlerSettingsScaffold();
}

class HandlerSettingsScaffold extends StatefulWidget {
  const HandlerSettingsScaffold({Key? key}) : super(key: key);

  @override
  _HandlerSettingsScaffoldState createState() =>
      _HandlerSettingsScaffoldState();
}

class _HandlerSettingsScaffoldState extends State<HandlerSettingsScaffold> {
  @override
  Widget build(BuildContext context) {
    int membersNumber = 6;

    List<MembersListTile> getList(int membersNumber) {
      List<MembersListTile> members = [];
      for (int i = 0; i < membersNumber; i++) {
        members.add(MembersListTile(
          leading: Icons.person,
          title: Text('Membro ${i}'),
        ));
      }
      return members;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Impostazioni Case'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.teal.shade50,
        child: ListView(
          children: [
            KShadowedContainer(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Colors.teal,
              child: Row(
                children: [
                  Text(
                    'Casa 1',
                    style: TextStyle(fontSize: 20, color: Colors.red.shade100),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.image,
                    size: 60,
                    color: Colors.teal.shade50,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      child: Icon(
                        Icons.edit,
                        color: Colors.teal,
                      ),
                      backgroundColor: Colors.red.shade100,
                    ),
                    onPressed: () => kFeatureNotDeveloped(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            KShadowedContainer(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: double.infinity,
                    color: Colors.teal,
                    child: ListTile(
                      leading: Icon(
                        Icons.group,
                        size: 35,
                        color: Colors.red.shade100,
                      ),
                      title: Text(
                        'Membri della casa',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red.shade100,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: getList(3),

                      // membersSetting(
                      //     4,
                      //     MembersListTile(
                      //         leading: Icons.person,
                      //         title: Text('Membro $membersNumber'))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(5)),
                    width: 250,
                    child: TextButton(
                      // style: ButtonStyle(backgroundColor: Colors.teal),
                      child: Text(
                        'Invita partecipanti',
                        style: TextStyle(
                          color: Colors.red.shade100,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1.3,
                        ),
                      ),
                      onPressed: () => kFeatureNotDeveloped(context),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                // style: ButtonStyle(backgroundColor: Colors.teal),
                child: Text(
                  'Elimina questa casa',
                  style: TextStyle(
                    color: Colors.red.shade100,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.3,
                  ),
                ),
                onPressed: () => kFeatureNotDeveloped(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// Text('La casa verrà eliminata definitivamente e nessun membro'),
// Sicuro di voler eliminare questa Casa?