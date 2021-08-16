import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodage_morello/components/new_food_content.dart';
import 'package:date_field/date_field.dart';
import 'package:group_button/group_button.dart';

enum DeadlineType {
  shortTerm,
  longTerm,
}

enum SectionType {
  Frigo,
  Freezer,
  Dispensa,
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
  String foodName = '';
  bool shortTermChecked = true;
  bool? cooked = false;
  DeadlineType? deadline = DeadlineType.shortTerm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Column(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Text(
                'Annulla',
                style: TextStyle(fontSize: 11, color: Colors.white),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text(
                'Salva',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.teal[50],
        padding: EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        child: ListView(
          children: [
            Image.asset(
              'images/logo.png',
              height: 60,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Inserisci il nome del prodotto',
                // labelText: 'Nome nuovo prodotto',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                focusColor: Colors.teal,
                // border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                hintText: 'Data di scadenza',
                labelStyle: TextStyle(fontSize: 20),
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
            SizedBox(
              height: 40,
            ),
            // TODO: inserire classe DeadLineContent
            // DeadlineTypeContent(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scegli il tipo di scadenza',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RadioListTile<DeadlineType>(
                  title: Text('Scadenza a breve termine'),
                  value: DeadlineType.shortTerm,
                  groupValue: deadline,
                  onChanged: (DeadlineType? value) {
                    setState(
                      () {
                        deadline = value;
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
                  value: cooked,
                  onChanged: !shortTermChecked
                      ? null
                      : (value) {
                          setState(() {
                            cooked = value;
                          });
                        },
                ),
                RadioListTile<DeadlineType>(
                  title: Text('Scadenza a lungo termine'),
                  value: DeadlineType.longTerm,
                  groupValue: deadline,
                  onChanged: (DeadlineType? value) {
                    setState(
                      () {
                        deadline = value;
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Table(
              children: [
                TableRow(
                  children: [
                    // TODO: provare GestureDetector
                    TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // disabledTextColor: Colors.black,
                        child: Column(
                          children: [
                            Image.asset(
                              'images/frigo.png',
                              width: 12,
                            ),
                            Text('Frigo'),
                          ],
                        ),
                        onPressed: () {
                          // bool value = true;
                          // if()
                        } // !SectionType.Frigo ? null : (){print('Frigo');},
                        ),
                    TextButton(
                      child: Column(
                        children: [
                          Icon(Icons.ac_unit_sharp),
                          Text('Freezer'),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Column(
                        children: [
                          Icon(Icons.free_breakfast),
                          Text(
                            'Dispensa',
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Etichette',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            GroupButton(
              isRadio: false,
              spacing: 25,
              onSelected: (index, isSelected) =>
                  print('$index button is selected'),
              buttons: [
                '🍎 Frutta',
                '🥦 Verdura',
                '🍞 Panificazione',
                '🧀 Latticini & 🥚 Uova',
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
            Table(
              children: [
                TableRow(
                  children: [
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Nome del negozio',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'Prezzo',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Note',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
