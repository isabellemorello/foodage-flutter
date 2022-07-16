import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food.dart';
import 'package:foodage_morello/constants/constants.dart';
// import 'package:provider/provider.dart';
import 'dart:collection';

import 'package:foodage_morello/models/food.dart';

class FoodListSections extends ChangeNotifier {
  void addNewCardToTheList(FoodCard newCard) {
    _freezerExpiredFood.add(newCard);
    print('$_freezerExpiredFood added');
    notifyListeners();
  }

  void removeItem(FoodCard removeCard) {
    _freezerExpiredFood.remove(removeCard);
    print('removed element from the list');
    notifyListeners();
  }

  UnmodifiableListView<FoodCard> get fridgeExpiredFood {
    return UnmodifiableListView(_fridgeExpiredFood);
  }

  int get listFridgeCount {
    return _fridgeExpiredFood.length;
  }

  UnmodifiableListView<FoodCard> get freezerExpiredFood {
    return UnmodifiableListView(_freezerExpiredFood);
  }

  int get listFreezerCount {
    return _freezerExpiredFood.length;
  }

  UnmodifiableListView<FoodCard> get dispensaExpiredFood {
    return UnmodifiableListView(_dispensaExpiredFood);
  }

  int get listDispensaCount {
    return _dispensaExpiredFood.length;
  }

  // // void sortListByDate() {
  // freezerExpiredFood.sort(String a, String b) {
  //   a = freezerExpiredFood.first.deadlineDate.toString();
  //   b = freezerExpiredFood.last.deadlineDate.toString();
  //   a.compareTo(b);
  // // };
  // }

// Lista Frigo
  List<FoodCard> _fridgeExpiredFood = [
    // Text('Scaduto'),
    // SizedBox(
    //   height: 30.0,
    // ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Cavolo',
      deadlineDate: '22/08/2022',
      // deleteFunction: () => removeItem(fridgeExpiredFood, 2),
    ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Cipolla',
      deadlineDate: '22/08/2022',
    ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Formaggio',
      deadlineDate: '22/08/2022',
    ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Mozzarella',
      deadlineDate: '22/08/2022',
    ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Pomodoro',
      deadlineDate: '22/08/2022',
    ),
    // SizedBox(
    //   height: 30.0,
    // ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Zucchine',
      deadlineDate: '22/08/2022',
    ),
    FoodCard(
      sectionIcon: kFridgeIcon,
      foodName: 'Pomodoro',
      deadlineDate: '22/08/2022',
    ),
  ];

// Lista Freezer
  List<FoodCard> _freezerExpiredFood = [
    FoodCard(
      sectionIcon: kFreezerIcon,
      foodName: 'Minestrone',
      deadlineDate: '22/08/2021',
    ),
    // SizedBox(
    //   height: 30.0,
    // ),
    FoodCard(
      sectionIcon: kFreezerIcon,
      foodName: 'Gelato',
      deadlineDate: '22/08/2022',
    ),
  ];

// Lista Dispensa
  List<FoodCard> _dispensaExpiredFood = [
    // Text('Scaduto'),
    // SizedBox(
    //   height: 30.0,
    // ),
    FoodCard(
      sectionIcon: kDispensaIcon,
      foodName: 'Crackers',
      deadlineDate: '22/08/2021',
    ),
    // SizedBox(
    //   height: 30.0,
    // ),
    // Text('Scadenze prossime'),
    // SizedBox(
    //   height: 30.0,
    // ),
    FoodCard(
      sectionIcon: kDispensaIcon,
      foodName: 'Grissini',
      deadlineDate: '22/08/2022',
    ),
  ];

// Lista schermata Tutti Food
  List allExpiredFood = [
    Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Scaduto'),
              FoodCard(
                sectionIcon: kFreezerIcon,
                foodName: 'Cipolla',
                deadlineDate: '22/08/2022',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Scade oggi'),
              FoodCard(
                sectionIcon: kDispensaIcon,
                foodName: 'Funghi',
                deadlineDate: '13/07/2022',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Scade domani'),
              FoodCard(
                sectionIcon: kFridgeIcon,
                foodName: 'Ciaooo',
                deadlineDate: '22/08/2021',
              ),
            ],
          ),
        ),
      ],
    )
  ];

// prendo tutta la lista di Food e la metto in Card
  // allList() {
  //   Food().foodList.forEach((element) {
  //     FoodCard(
  //         sectionIcon: element.sectionIcon,
  //         foodName: element.name,
  //         deadlineDate: element.deadlineDate);
  //   });
  // }
}
