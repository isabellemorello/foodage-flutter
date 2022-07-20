import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';

/// usato in handler_home_screen per il numero di icone dei membri
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

class MembersListTile extends StatelessWidget {
  MembersListTile({
    required this.leading,
    required this.title,
  });
  final IconData leading;
  final Text title;

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
              onPressed: () => kDialogRemoveMemberFromHome(context)),
        ),
      ],
    );
  }
}
