import 'package:flutter/material.dart';

enum DeadlineType {
  shortTerm,
  longTerm,
}

class DeadlineTypeContent extends StatefulWidget {
  @override
  _DeadlineTypeContentState createState() => _DeadlineTypeContentState();
}

class _DeadlineTypeContentState extends State<DeadlineTypeContent> {
  bool shortTermChecked = true;
  bool? cooked = false;
  // DeadlineType? _deadline = DeadlineType.shortTerm;

  @override
  Widget build(BuildContext context) {
    return Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       'Scegli il tipo di scadenza',
        //       style: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 15,
        //     ),
        //     RadioListTile<DeadlineType>(
        //       title: Text('Scadenza a breve termine'),
        //       value: DeadlineType.shortTerm,
        //       groupValue: _deadline,
        //       onChanged: (DeadlineType? value) {
        //         setState(
        //               () {
        //             _deadline = value;
        //             shortTermChecked = true;
        //           },
        //         );
        //       },
        //       controlAffinity: ListTileControlAffinity.leading,
        //       activeColor: Colors.teal,
        //     ),
        //     CheckboxListTile(
        //       title: Text(
        //         'Cucinato da me',
        //       ),
        //       contentPadding: EdgeInsets.only(
        //         left: 100,
        //       ),
        //       activeColor: Colors.teal,
        //       controlAffinity: ListTileControlAffinity.leading,
        //       value: cooked,
        //       onChanged: !shortTermChecked
        //           ? null
        //           : (value) {
        //         setState(() {
        //           cooked = value;
        //         });
        //       },
        //     ),
        //     RadioListTile<DeadlineType>(
        //       title: Text('Scadenza a lungo termine'),
        //       value: DeadlineType.longTerm,
        //       groupValue: _deadline,
        //       onChanged: (DeadlineType? value) {
        //         setState(
        //               () {
        //             _deadline = value;
        //             shortTermChecked = false;
        //           },
        //         );
        //       },
        //       controlAffinity: ListTileControlAffinity.leading,
        //       activeColor: Colors.teal,
        //     ),
        //   ],
        );
  }
}
