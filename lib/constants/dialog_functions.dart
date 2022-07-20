import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/models/food.dart';

/// Finestra di dialogo che avverte l'utente che può eliminare definitivamente il prodotto dall'applicazione
Future<dynamic> kDialogToDeleteFood(
    BuildContext context, final Food food, FoodListProvider foodListProvider) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red.shade100,
      title: Text(
        'Elimina prodotto',
        style: TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Questo prodotto verrà definitivamente eliminato dall\'applicazione',
        style: TextStyle(
          color: Colors.teal[600],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'ANNULLA',
            style:
                TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            foodListProvider.deleteFood(food);
            print('${food.id} deleted');
            Navigator.of(context).pop();
          },
          child: Text(
            'ELIMINA',
            style:
                TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

/// Finestra di dialogo che avverte l'utente che può ripristinare e riaggiungere il prodotto alla lista
Future<dynamic> kDialogToRestoreFood(
    BuildContext context, Food food, FoodListProvider foodListProvider) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red.shade100,
      title: Text(
        'Ripristina prodotto',
        style: TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Questo prodotto verrà riaggiunto alla lista dei prodotti in scadenza',
        style: TextStyle(
          color: Colors.teal[600],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'ANNULLA',
            style:
                TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            foodListProvider.moveFoodToList(food);
            print('${food.id} deleted');
            Navigator.of(context).pop();
          },
          child: Text(
            'RIPRISTINA',
            style:
                TextStyle(color: Colors.teal[600], fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

/// Informa l'utente sulla funzionalità della schermata "Le mie case"
Future<dynamic> kDialogHandlerHomeScreen(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Le mie case'),
      content: Text(
        'Questa è la sezione dove puoi gestire tutte le informazioni riguardanti le varie case. \nTenendo premuto su una casa, puoi cambiare l\'ordine delle case e quella che sarà in prima posizione sarà la casa che visualizzerai nella Home, con tutte le relative liste.',
      ),
      backgroundColor: Colors.teal.shade50,
      actions: [
        TextButton(
          child: Text('HO CAPITO'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

/// Informa l'utente che la feature richiesta non è stata ancora implementata
Future<dynamic> kDialogFeatureNotDeveloped(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.teal[600],
            content: Text(
              'Questa feature non è stata ancora implementata.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.teal[50]),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.teal.shade50),
                  ))
            ],
          ));
}
