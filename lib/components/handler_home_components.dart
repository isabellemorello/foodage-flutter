import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';

List<Widget> membersHome(int numberMembers) {
  List<Widget> members = [];
  for (int i = 0; i < numberMembers; i++) {
    members.add(
      Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.teal,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.teal.shade50,
              child: Icon(
                Icons.person,
                color: Colors.teal,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
  return members;
}

List<MembersListTile> membersSetting(
    int numberMembers, MembersListTile memberList) {
  List<MembersListTile> members = [];
  for (int i = 0; i < numberMembers; i++) {
    members.add(
      memberList,
    );
  }
  return members;
}

class MembersListTile extends StatelessWidget {
  MembersListTile({
    required this.leading,
    required this.title,
  });
  IconData leading;
  Text title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                leading,
                color: Colors.teal,
              ),
            ],
          ),
          title: title,
          subtitle: Text('E-mail'),
          trailing: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.teal,
              ),
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('ATTENZIONE'),
                      content: Text(
                          'Sicuro di voler rimuovere questo Membro dalla Casa?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () => kFeatureNotDeveloped(context),
                          child: Text('Sì'),
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}