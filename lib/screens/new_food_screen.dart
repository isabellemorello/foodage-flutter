import 'package:flutter/material.dart';
import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:date_field/date_field.dart';
import 'package:foodage_morello/models/food_list_model.dart';
import 'package:group_button/group_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/components/food_layout/food_list_sections.dart';
import 'package:foodage_morello/components/food_layout/food_card.dart';
import 'package:foodage_morello/constants/constants.dart';

enum DeadlineType {
  shortTerm,
  longTerm,
}

class NewFoodScreen extends StatelessWidget {
  static const String id = 'new_food_screen';

  @override
  Widget build(BuildContext context) {
    return NewFoodScaffold();
  }
}

class NewFoodScaffold extends StatefulWidget {
  @override
  _NewFoodScaffoldState createState() => _NewFoodScaffoldState();
}

class _NewFoodScaffoldState extends State<NewFoodScaffold> {
  // final _auth = FirebaseAuth.instance;
  // String foodName = '';
  bool shortTermChecked = true;
  // bool? cooked = false;
  // DeadlineType? deadline = DeadlineType.shortTerm;

  late User loggedInUser;
  String currentLoggedUser = '';
  String? foodName = foodsModel.foodBeingEdited?.name;
  String? deadlineDate = foodsModel.foodBeingEdited?.deadlineDate;
  String? deadlineType = foodsModel.foodBeingEdited?.deadlineType;
  // bool? cookedByMe = foodsModel.foodBeingEdited?.cookedByMe;
  SectionType? sectionType = foodsModel.foodBeingEdited?.sectionType;
  // String? sectionIcon = foodsModel.foodBeingEdited?.sectionIcon;
  // List<String>? labelList = foodsModel.foodBeingEdited?.labelList;
  String? shopName = foodsModel.foodBeingEdited?.shopName;
  String? price = foodsModel.foodBeingEdited?.price;
  String? note = foodsModel.foodBeingEdited?.note;

  bool? cookedByMe = false;

  // TODO: inserire in tutti i TextField:
  // onChanged: (value) {},

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       currentLoggedUser = loggedInUser.email.toString();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  TextEditingController _foodNameController = TextEditingController();
  // TextEditingController _deadlineDateController = TextEditingController();
  // TextEditingController _deadlineTypeController = TextEditingController();
  // TextEditingController _cookedByMeController = TextEditingController();
  // TextEditingController _sectionTypeController = TextEditingController();
  // TextEditingController _labelListController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
      builder: (context, foodListSections, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: newFoodAppBar(context),
          body: Container(
            color: Colors.teal[50],
            padding: EdgeInsets.only(top: 20, right: 30, left: 30),
            child: ListView(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 40,
                  child: Image.asset(
                    'images/logo.png',
                    height: 50,
                    color: Colors.red.shade100,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _foodNameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Inserisci il nome del prodotto',
                    hintStyle: TextStyle(
                      color: Colors.teal.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                    // labelText: 'Nome nuovo prodotto',
                  ),
                  onChanged: (String value) {
                    foodName = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    focusColor: Colors.teal,
                    // border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    hintText: 'Data di scadenza',
                    // labelStyle: TextStyle(fontSize: 20),
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (value) {
                    setState(() {
                      deadlineDate = value.toString();
                    });
                  },
                  onSaved: (value) {
                    deadlineDate = value.toString();
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                //TODO: inserire classe DeadLineContent DeadlineTypeContent(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Scegli il tipo di scadenza',
                      style: kTitleTextStyle(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RadioListTile<String>(
                      title: Text('Scadenza a breve termine'),
                      value: DeadlineType.shortTerm.toString(),
                      groupValue: deadlineType,
                      onChanged: (String? value) {
                        setState(
                          () {
                            deadlineType = value;
                            shortTermChecked = true;
                          },
                        );
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.teal,
                    ),
                    CheckboxListTile(
                      title: Text(
                        'Cucinato da me',
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 100,
                      ),
                      activeColor: Colors.teal,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: cookedByMe,
                      onChanged: !shortTermChecked
                          ? null
                          : (bool? value) {
                              setState(() {
                                cookedByMe = value;
                              });
                            },
                    ),
                    RadioListTile<String>(
                      title: Text('Scadenza a lungo termine'),
                      value: DeadlineType.longTerm.toString(),
                      groupValue: deadlineType,
                      onChanged: (String? value) {
                        setState(
                          () {
                            deadlineType = value;
                            shortTermChecked = false;
                          },
                        );
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.teal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sezione',
                  style: kTitleTextStyle(),
                ),
                SizedBox(
                  height: 15,
                ),
                Table(
                  children: [
                    TableRow(
                      children: [
                        SectionTypeSelectionButton(),
                        //
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Etichette',
                  style: kTitleTextStyle(),
                ),
                SizedBox(
                  height: 15,
                ),
                GroupButton(
                  isRadio: false,
                  spacing: 25,
                  onSelected: (index, isSelected) {
                    print('$index button is selected');
                    // labelList = GroupButton.buttons[index];
                    // print(labelList);
                    // ! da rivedere, non so se è giusto
                    // return labelList?[index];
                  },
                  buttons: [
                    '🍎 Frutta',
                    '🥦 Verdura',
                    '🍞 Panificazione',
                    '🧀 Latticini'
                        '🥚 Uova',
                    '🥩 Carne',
                    '🐟 Pesce',
                    '🛢 Scatolame',
                    '🌿 Condimenti & Spezie',
                    '🥫 Salse & Sughi pronti',
                    '❄️ Surgelati',
                    '🍝 Pasta, Riso & Cereali',
                    '🍰 Snack & Dolci',
                    '🧃 Bevande',
                    '🐾 Animali',
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                SizedBox(
                  height: 40,
                ),
                // Table(
                //   children: [
                //     TableRow(
                //       children: [
                TextFormField(
                  controller: _shopNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Nome del negozio',
                    hintStyle: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (String value) {
                    shopName = value;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Prezzo',
                    hintStyle: TextStyle(
                      color: Colors.teal.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (String value) {
                    price = value;
                  },
                ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _noteController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(
                        color: Colors.teal.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 1.0),
                      ),
                    ),
                    onChanged: (String value) {
                      note = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar newFoodAppBar(BuildContext context) {
    return AppBar(
      leading: TextButton(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Annulla',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Center(
        child: Text(
          'Nuovo Prodotto',
        ),
      ),
      actions: [
        TextButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Salva',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          ),
          onPressed: () {
            // final FoodCard newFood = FoodCard(
            //   sectionIcon: kFreezerIcon,
            //   foodName: 'Cavolo',
            //   deadlineDate: '22/08/2022',
            // );
            // Provider.of<FoodListSections>(context, listen: false)
            //     .addNewCardToTheList(newFood);
            Navigator.pop(context);
            print('added from save new food');
            // return foodListSections.freezerExpiredFood;
            //TODO
            // Food newFood = Food(
            //   foodName: foodName,
            //   deadlineDate: deadlineDate,
            //   deadlineType: deadlineType,
            //   cookedByMe: cookedByMe,
            //   sectionType: sectionType,
            //   labelList: labelList,
            //   shopName: shopName,
            //   price: price,
            //   note: note,
            // );
            // // ! TODO: capire perché è statica
            // await FoodDBWorker.addFood(
            //   foodName as String,
            //   newFood,
            // );
          },
        )
      ],
    );
  }

  // Future<void> _save(BuildContext context) async {
  //   // // Intanto dobbiamo andare a convalidare il form
  //   // if (!_formKey.currentState!.validate()) {
  //   //   return;
  //   // }
  //   // // _formKey.currentState!.save();
  //   // // siamo nel caso in cui stiamo creando una nota vuota, perché l'identificatore di
  //   // // una nota non viene creato / definito fino a quando non abbiamo una nota già completa perché
  //   // // l'identificatore viene creato all'interno del codice del DB, nella funzione create()
  //   // // Noi quindi creiamo una nuova nota e la salviamo nel notesModel.noteBeingEdited
  //   if (foodsModel.foodBeingEdited?.currentUser == null) {
  //     await FoodDBWorker().newFood(foodsModel.foodBeingEdited as Food);
  //     print('Note created');
  //   } else {
  //     // In questo caso la nota esiste già e noi vogliamo salvare le modifiche
  //     await FoodDBWorker().updateFood(foodsModel.foodBeingEdited as Food);
  //     print('Note updated');
  //   }

  //   Navigator.popAndPushNamed(context, HomepageScreen.id);

  //   // Vogliamo che appaia un messaggio che ci dica che effettivamente la nota è stata salvata
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.lime,
  //       duration: Duration(seconds: 2),
  //       content: Text('Note saved'),
  //     ),
  //   );
  // }
}
