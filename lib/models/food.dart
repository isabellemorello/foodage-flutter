import 'package:flutter/material.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'labels.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String? id;
  String? name;
  String? quantity;
  String? deadlineDate;
  String? deadlineType = DeadlineType.ShortTerm.toString();
  bool? cookedByMe = false;
  String? sectionType = SectionType.Frigo.toString();
  IconData? sectionIcon;
  List<Label>? labelList = [];
  String? shopName;
  String? price;
  String? note;
  String? currentUser;

  Food({
    this.id,
    this.name,
    this.quantity,
    this.deadlineDate,
    this.sectionType,
    this.deadlineType,
    this.cookedByMe,
    this.sectionIcon,
    this.labelList,
    this.shopName,
    this.price,
    this.note,
    this.currentUser,
  });

  List<Food> foodList = [
    Food(
        id: '1',
        name: 'minestrone',
        quantity: '2 confezioni',
        deadlineDate: '22/01/2023',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'freezer',
        cookedByMe: false,
        sectionIcon: kFreezerIcon,
        labelList: [labels[1], labels[10]],
        shopName: 'bel negozio',
        price: '3,59'),
    Food(
        id: '2',
        name: 'mozzarella',
        quantity: '3 unità',
        deadlineDate: '14/07/2022',
        deadlineType: 'Scadenza a breve termine',
        sectionType: 'fridge',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[3]],
        shopName: 'bel negozio',
        price: '2,49'),
    Food(
        id: '3',
        name: 'formaggio Asiago',
        quantity: '1 unità',
        deadlineDate: '22/08/2022',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'fridge',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[3]],
        shopName: 'supermercato',
        price: '4,79'),
    Food(
        id: '4',
        name: 'funghi',
        quantity: '4 confezioni',
        deadlineDate: '22/01/2025',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'dispensa',
        cookedByMe: false,
        sectionIcon: kDispensaIcon,
        labelList: [labels[7]],
        shopName: 'discount',
        price: '3,59'),
    Food(
        id: '5',
        name: 'pomodori',
        quantity: '500 grammi',
        deadlineDate: '22/01/2023',
        deadlineType: 'Scadenza a breve termine',
        sectionType: 'frigo',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[1]],
        shopName: 'discount',
        price: '3,59'),
    Food(
        id: '6',
        name: 'pesche',
        quantity: '5 unità',
        deadlineDate: '16/08/2022',
        deadlineType: 'Scadenza a breve termine',
        sectionType: 'frigo',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[0]],
        shopName: 'bel negozio',
        price: '3,59'),
    Food(
        id: '7',
        name: 'cipolla',
        quantity: '1000 grammi',
        deadlineDate: '22/09/2022',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'dispensa',
        cookedByMe: false,
        sectionIcon: kDispensaIcon,
        labelList: [labels[1]],
        shopName: 'bel negozio',
        price: '2,59'),
    Food(
        id: '8',
        name: 'gelato',
        quantity: '1 confezione',
        deadlineDate: '22/09/2022',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'freezer',
        cookedByMe: false,
        sectionIcon: kFreezerIcon,
        labelList: [labels[3], labels[10]],
        shopName: 'supermercato',
        price: '3,59'),
    Food(
        id: '9',
        name: 'pollo',
        quantity: '1 confezione',
        deadlineDate: '13/07/2022',
        sectionType: 'frigo',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[5]],
        shopName: 'bel negozio',
        price: '5,59'),
    Food(
        id: '10',
        name: 'grissini',
        quantity: '1 confezione',
        deadlineDate: '22/12/2022',
        deadlineType: 'Scadenza a lungo termine',
        sectionType: 'dispensa',
        cookedByMe: false,
        sectionIcon: kDispensaIcon,
        labelList: [labels[2]],
        shopName: 'discount',
        price: '1,99'),
    Food(
        id: '11',
        name: 'zucchine',
        quantity: '4 unità',
        deadlineDate: '22/01/2023',
        deadlineType: 'Scadenza a breve termine',
        sectionType: 'frigo',
        cookedByMe: false,
        sectionIcon: kFridgeIcon,
        labelList: [labels[1]],
        shopName: 'bel negozio',
        price: '3,99'),
  ];

  // factory Food.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map<String, dynamic>;

  //   return Food(
  //     id: doc.id,
  //     foodName: data['foodName'] ?? '',
  //     deadlineDate: data['deadlineDate'] ?? '',
  //     deadlineType: data['deadlineType'] ?? '',
  //     cookedByMe: data['cookedByMe'] ?? '',
  //     sectionType: data['sectionType'] ?? 'SectionType.Frigo.toString()',
  //     labelList: data['labelList'] ?? [],
  //     shopName: data['shopName'] ?? '',
  //     price: data['price'] ?? '',
  //     note: data['note'] ?? '',
  //   );
  // }
}
