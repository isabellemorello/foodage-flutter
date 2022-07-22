import 'package:flutter/material.dart';
import 'package:foodage_morello/components/food_layout/food_list_provider.dart';
import 'package:foodage_morello/components/settings_components.dart';
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

/// Dà maggiori informazioni su cosa si intende per scadenza a BREVE o a LUNGO termine
Future<dynamic> kDialogSettingsInfoDeadlineType(BuildContext context) {
  return showDialog(
      context: context, builder: (_) => DeadlineFreeAlertDialog());
}

/// Informa l'utente sulla funzionalità della schermata "Le mie case"
Future<dynamic> kDialogHandlerHomeScreen(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.teal.shade600,
      title: Text(
        'Le mie case',
        style: TextStyle(
          color: Colors.teal.shade50,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'Questa è la sezione dove puoi gestire tutte le informazioni riguardanti le varie case. \nTenendo premuto su una casa, puoi cambiare l\'ordine delle case e quella che sarà in prima posizione sarà la casa che visualizzerai nella Home, con tutte le relative liste.',
        style: TextStyle(color: Colors.teal.shade50),
      ),
      actions: [
        TextButton(
          child: Text(
            'HO CAPITO',
            style: TextStyle(color: Colors.teal.shade50),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

/// Chiede conferma per eliminare un componente dalla casa
Future<dynamic> kDialogRemoveMemberFromHome(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context2) => AlertDialog(
      backgroundColor: Colors.red[50],
      title: Text(
        'ATTENZIONE',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        'Sicuro di voler rimuovere questo Membro dalla Casa?',
        style: TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'NO',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () => kDialogFeatureNotDeveloped(context2),
          child: Text(
            'SI',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}

/// Per il login
Future<dynamic> kDialogInvalidLogin(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.red.shade100,
      title: Text(
        'Credenziali non valide',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        'L\'e-mail o la password è errata.',
        style: TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'RIPROVA',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
