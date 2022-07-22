import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:foodage_morello/models/food.dart';
import 'package:foodage_morello/models/labels.dart';
import 'package:group_button/group_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/constants/constants.dart';

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
  bool shortTermChecked = true;

  late User loggedInUser;
  String currentLoggedUser = '';
  Food food = Food();
  String? name;
  DateTime? deadlineDate;
  String? deadlineType = DeadlineType.ShortTerm.toString();
  bool? cookedByMe = false;
  SectionType sectionType = SectionType.Frigo;
  IconData? sectionIcon;
  String? shopName;
  String? price;
  String? note;
  List<String> quantityList = ['confezione', 'grammi', 'unità'];
  String? valueSelectedQuantity = 'confezione';
  String? quantityNumber = '1';

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  TextEditingController _foodNameController = TextEditingController();
  TextEditingController _quantityNumberController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<FoodListProvider>(
      builder: (context, foodListProvider, child) {
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
                //* Nome
                Form(
                  key: nameKey,
                  child: TextFormField(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? inValue) {
                      if (inValue.toString().length == 0) {
                        return 'Per favore inserisci il nome del nuovo prodotto';
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //* Seleziona data
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.teal,
                    ),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    focusColor: Colors.teal,
                    // border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.event_note,
                      color: Colors.teal,
                    ),
                    hintText: 'Data di scadenza',
                    // labelStyle: TextStyle(fontSize: 20),
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  onDateSelected: (value) {
                    setState(() {
                      deadlineDate = value;
                    });
                  },
                  onSaved: (value) {
                    deadlineDate = value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                //* Quantità
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Inserisci la quantità',
                      style: kTitleTextStyle(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          child: TextFormField(
                            controller: _quantityNumberController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Quantità',
                              hintStyle: TextStyle(
                                color: Colors.teal.shade500,
                              ),
                              // labelText: 'Nome nuovo prodotto',
                            ),
                            onChanged: (String value) {
                              quantityNumber = value;
                            },
                          ),
                        )),
                        Expanded(
                          child: Container(
                            width: 200,
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: (Colors.teal), width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: valueSelectedQuantity,
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.teal,
                                  ),
                                  iconSize: 30,
                                  items: quantityList
                                      .map(buildMenuQuantity)
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      valueSelectedQuantity = value;
                                      print(value);
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                //* Tipo di scadenza (breve o lunga, cucinato)
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
                      value: DeadlineType.ShortTerm.toString(),
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
                      value: DeadlineType.LongTerm.toString(),
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
                //* Tipo di Sezione (frigo, freezer, dispensa)
                Text(
                  'Sezione',
                  style: kTitleTextStyle(),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          decoration: BoxDecoration(
                            color: sectionType == SectionType.Frigo
                                ? kActiveColorSectionType
                                : kInactiveColorSectionType,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                kFridgeIcon,
                                color: sectionType == SectionType.Frigo
                                    ? kActiveColorComponentsSectionType
                                    : kInactiveColorComponentsSectionType,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Frigo',
                                style: TextStyle(
                                  color: sectionType == SectionType.Frigo
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
                              sectionType = SectionType.Frigo;
                              foodListProvider.setSectionType(sectionType);
                              print('Button pressed: $sectionType');
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          decoration: BoxDecoration(
                            color: sectionType == SectionType.Freezer
                                ? kActiveColorSectionType
                                : kInactiveColorSectionType,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                kFreezerIcon,
                                color: sectionType == SectionType.Freezer
                                    ? kActiveColorComponentsSectionType
                                    : kInactiveColorComponentsSectionType,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Freezer',
                                style: TextStyle(
                                  color: sectionType == SectionType.Freezer
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
                              sectionType = SectionType.Freezer;
                              foodListProvider.setSectionType(sectionType);
                              print('Button pressed: $sectionType');
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          decoration: BoxDecoration(
                            color: sectionType == SectionType.Dispensa
                                ? kActiveColorSectionType
                                : kInactiveColorSectionType,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                kDispensaIcon,
                                color: sectionType == SectionType.Dispensa
                                    ? kActiveColorComponentsSectionType
                                    : kInactiveColorComponentsSectionType,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Dispensa',
                                style: TextStyle(
                                  color: sectionType == SectionType.Dispensa
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
                              sectionType = SectionType.Dispensa;
                              foodListProvider.setSectionType(sectionType);
                              print('Button pressed: $sectionType');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                //* Etichette
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
                  },
                  buttons: [
                    labels[0].icon.toString() + ' ' + labels[0].name.toString(),
                    labels[1].icon.toString() + ' ' + labels[1].name.toString(),
                    labels[2].icon.toString() + ' ' + labels[2].name.toString(),
                    labels[3].icon.toString() + ' ' + labels[3].name.toString(),
                    labels[4].icon.toString() + ' ' + labels[4].name.toString(),
                    labels[5].icon.toString() + ' ' + labels[5].name.toString(),
                    labels[6].icon.toString() + ' ' + labels[6].name.toString(),
                    labels[7].icon.toString() + ' ' + labels[7].name.toString(),
                    labels[8].icon.toString() + ' ' + labels[8].name.toString(),
                    labels[9].icon.toString() + ' ' + labels[9].name.toString(),
                    labels[10].icon.toString() +
                        ' ' +
                        labels[10].name.toString(),
                    labels[11].icon.toString() +
                        ' ' +
                        labels[11].name.toString(),
                    labels[12].icon.toString() +
                        ' ' +
                        labels[12].name.toString(),
                    labels[13].icon.toString() +
                        ' ' +
                        labels[13].name.toString(),
                    labels[14].icon.toString() +
                        ' ' +
                        labels[14].name.toString(),
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                SizedBox(
                  height: 40,
                ),
                //* Negozio
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
                //* Prezzo
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
                SizedBox(
                  height: 40,
                ),
                //* Note
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
                size: 20,
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
                  size: 20,
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
            if (nameKey.currentState!.validate()) {
              food = Food(
                name: name,
                quantity: '$quantityNumber $valueSelectedQuantity',
                deadlineDate:
                    Provider.of<FoodListProvider>(context, listen: false)
                        .formatDateAsDayMonthYear(deadlineDate),
                deadlineType: deadlineType,
                cookedByMe:
                    Provider.of<FoodListProvider>(context, listen: false)
                        .setCookedByMe(cookedByMe as bool),
                sectionType: sectionType,
                sectionIcon: sectionIcon,
                shopName: shopName,
                price: price,
                note: note,
              );

              Provider.of<FoodListProvider>(context, listen: false)
                  .setDeadlineType(food);
              Provider.of<FoodListProvider>(context, listen: false)
                  .setSectionIcon(food);
              Provider.of<FoodListProvider>(context, listen: false)
                  .addNewFood(food);

              Navigator.pop(context);
              print('added ${food.name} from save new food');
              print(
                'name ${food.name},\n quantity ${food.quantity},\n deadline: ${food.deadlineDate},\n deadlineType: ${food.deadlineType},\n cookedByMe: ${food.cookedByMe},\n sectionType: ${food.sectionType},\n sectionIcon: ${food.sectionIcon}\n, shopName: ${food.shopName},\n price: ${food.price},\n note: ${food.note}',
              );
              final snackBar = SnackBar(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                width: MediaQuery.of(context).size.width - 30,
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.red[100],
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nuovo prodotto aggiunto',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.teal[600],
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${food.name.toString().toUpperCase()}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red.shade100,
                  title: Text(
                    'Campo vuoto',
                    style: TextStyle(
                        color: Colors.teal[600], fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'Il nome del nuovo prodotto è obbligatorio',
                    style: TextStyle(
                      color: Colors.teal[600],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.teal[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        )
      ],
    );
  }

  /// Per il menù a tendina della quantità
  DropdownMenuItem<String> buildMenuQuantity(quantity) {
    return DropdownMenuItem(
      value: quantity,
      child: Text(
        quantity,
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
      ),
    );
  }
}
