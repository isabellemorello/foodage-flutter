import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
// import 'package:foodage_morello/models/food_list_model.dart';

enum DeadlineType {
  ShortTerm,
  LongTerm,
}

enum SectionType {
  Frigo,
  Freezer,
  Dispensa,
}

class SectionTypeSelectionButton extends StatefulWidget {
  const SectionTypeSelectionButton({Key? key}) : super(key: key);

  @override
  _SectionTypeSelectionButtonState createState() =>
      _SectionTypeSelectionButtonState();
}

class _SectionTypeSelectionButtonState
    extends State<SectionTypeSelectionButton> {
  String sectionType = SectionType.Frigo.toString();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 1,
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              color: sectionType == SectionType.Frigo.toString()
                  ? kActiveColorSectionType
                  : kInactiveColorSectionType,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  kFridgeIcon,
                  color: sectionType == SectionType.Frigo.toString()
                      ? kActiveColorComponentsSectionType
                      : kInactiveColorComponentsSectionType,
                ),
                SizedBox(height: 8),
                Text(
                  'Frigo',
                  style: TextStyle(
                    color: sectionType == SectionType.Frigo.toString()
                        ? kActiveColorComponentsSectionType
                        : kInactiveColorComponentsSectionType,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(
              () {
                sectionType = SectionType.Frigo.toString();
                print('Button pressed: $sectionType');
                // foodsModel.foodBeingEdited!.sectionType = 'Frigo';
                // foodsModel.setSectionType('Frigo');
              },
            );
          },
          // splashColor: Colors.teal,
        ),
      ),
      Expanded(
        flex: 1,
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              color: sectionType == SectionType.Freezer.toString()
                  ? kActiveColorSectionType
                  : kInactiveColorSectionType,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  kFreezerIcon,
                  color: sectionType == SectionType.Freezer.toString()
                      ? kActiveColorComponentsSectionType
                      : kInactiveColorComponentsSectionType,
                ),
                SizedBox(height: 8),
                Text(
                  'Freezer',
                  style: TextStyle(
                    color: sectionType == SectionType.Freezer.toString()
                        ? kActiveColorComponentsSectionType
                        : kInactiveColorComponentsSectionType,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(
              () {
                sectionType = SectionType.Freezer.toString();
                print('Button pressed: $sectionType');
                // foodsModel.foodBeingEdited!.sectionType = 'Freezer';
                // foodsModel.setSectionType('Freezer');
              },
            );
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              color: sectionType == SectionType.Dispensa.toString()
                  ? kActiveColorSectionType
                  : kInactiveColorSectionType,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Icon(
                  kDispensaIcon,
                  color: sectionType == SectionType.Dispensa.toString()
                      ? kActiveColorComponentsSectionType
                      : kInactiveColorComponentsSectionType,
                ),
                SizedBox(height: 8),
                Text(
                  'Dispensa',
                  style: TextStyle(
                    color: sectionType == SectionType.Dispensa.toString()
                        ? kActiveColorComponentsSectionType
                        : kInactiveColorComponentsSectionType,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(
              () {
                sectionType = SectionType.Dispensa.toString();
                print('Button pressed: $sectionType');
                // foodsModel.foodBeingEdited!.sectionType = 'Dispensa';
                // foodsModel.setSectionType('Dispensa');
              },
            );
          },
        ),
      ),
    ]);
  }
}

// class DeadlineTypeContent extends StatefulWidget {
//   @override
//   _DeadlineTypeContentState createState() => _DeadlineTypeContentState();
// }

// class _DeadlineTypeContentState extends State<DeadlineTypeContent> {
//   bool shortTermChecked = true;
//   bool? cooked = false;
//   // DeadlineType? _deadline = DeadlineType.shortTerm;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         //   children: [
//         //     Text(
//         //       'Scegli il tipo di scadenza',
//         //       style: TextStyle(
//         //         fontSize: 20,
//         //         fontWeight: FontWeight.bold,
//         //       ),
//         //     ),
//         //     SizedBox(
//         //       height: 15,
//         //     ),
//         //     RadioListTile<DeadlineType>(
//         //       title: Text('Scadenza a breve termine'),
//         //       value: DeadlineType.shortTerm,
//         //       groupValue: _deadline,
//         //       onChanged: (DeadlineType? value) {
//         //         setState(
//         //               () {
//         //             _deadline = value;
//         //             shortTermChecked = true;
//         //           },
//         //         );
//         //       },
//         //       controlAffinity: ListTileControlAffinity.leading,
//         //       activeColor: Colors.teal,
//         //     ),
//         //     CheckboxListTile(
//         //       title: Text(
//         //         'Cucinato da me',
//         //       ),
//         //       contentPadding: EdgeInsets.only(
//         //         left: 100,
//         //       ),
//         //       activeColor: Colors.teal,
//         //       controlAffinity: ListTileControlAffinity.leading,
//         //       value: cooked,
//         //       onChanged: !shortTermChecked
//         //           ? null
//         //           : (value) {
//         //         setState(() {
//         //           cooked = value;
//         //         });
//         //       },
//         //     ),
//         //     RadioListTile<DeadlineType>(
//         //       title: Text('Scadenza a lungo termine'),
//         //       value: DeadlineType.longTerm,
//         //       groupValue: _deadline,
//         //       onChanged: (DeadlineType? value) {
//         //         setState(
//         //               () {
//         //             _deadline = value;
//         //             shortTermChecked = false;
//         //           },
//         //         );
//         //       },
//         //       controlAffinity: ListTileControlAffinity.leading,
//         //       activeColor: Colors.teal,
//         //     ),
//         //   ],
//         );
//   }
// }
