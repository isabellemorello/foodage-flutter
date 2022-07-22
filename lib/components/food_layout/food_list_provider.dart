import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:foodage_morello/constants/constants.dart';
import 'package:foodage_morello/models/food.dart';

class FoodListProvider extends ChangeNotifier {
  Food? expandedFood;
  SectionType? sectionType;
  bool isList = true;
  bool isListLabel = true;

  /// Seleziona il singolo food
  void setExpandedFood(Food food) {
    expandedFood = food;
    notifyListeners();
  }

  /// Setta la variabile booleana affinché venga visualizzata la vista dei food a Lista o a Griglia
  void setIsList() {
    isList = !isList;
    notifyListeners();
  }

  /// Setta la variabile booleana affinché venga visualizzata la vista delle etichette a Lista o a Griglia
  void setIsListLabel() {
    isListLabel = !isListLabel;
    notifyListeners();
  }

  /// Seleziona il tipo di sezione (es. Frigo, Freezer o Dispensa)
  void setSectionType(SectionType inSectionType) {
    sectionType = inSectionType;
    notifyListeners();
  }

  /// Converte da SectionType alla Stringa opportuna
  String? setSectionTypeString(Food food) {
    if (food.sectionType == SectionType.Frigo) {
      return 'Frigo';
    } else if (food.sectionType == SectionType.Freezer) {
      return 'Freezer';
    } else if (food.sectionType == SectionType.Dispensa) {
      return 'Dispensa';
    }
    notifyListeners();
  }

  /// In base alla sezione, viene visualizzata l'icona opportuna
  IconData? setSectionIcon(Food food) {
    if (food.sectionType == SectionType.Frigo) {
      food.sectionIcon = kFridgeIcon;
    } else if (food.sectionType == SectionType.Freezer) {
      food.sectionIcon = kFreezerIcon;
    } else if (food.sectionType == SectionType.Dispensa) {
      food.sectionIcon = kDispensaIcon;
    }
    notifyListeners();
  }

  /// In base al tipo di scadenza, viene salvata la stringa opportuna (es. Breve termine, Lungo termine)
  String? setDeadlineType(Food food) {
    if (food.deadlineType == DeadlineType.ShortTerm.toString()) {
      food.deadlineType = 'Breve termine';
    } else if (food.deadlineType == DeadlineType.LongTerm.toString()) {
      food.deadlineType = 'Lungo termine';
    }
    notifyListeners();
  }

  /// Specifica se il food è stato cucinato o meno
  String? setCookedByMe(bool? cookedByMe) {
    if (cookedByMe == true) {
      return 'Sì';
    } else if (cookedByMe == false || cookedByMe == null) {
      return 'No';
    }
    notifyListeners();
  }

  /// Elimina un singolo food definitivamente
  void deleteFood(Food food) {
    foodList.remove(food);
    notifyListeners();
  }

  /// Sposta il food dalla lista al cestino
  void moveFoodToTrash(Food food) {
    food.isDeleted = true;
    notifyListeners();
  }

  /// Sposta il food dal cestino alla lista
  void moveFoodToList(Food food) {
    food.isDeleted = false;
    notifyListeners();
  }

  /// Aggiunge un nuovo food alla lista
  void addNewFood(Food food) {
    foodList.add(food);
    notifyListeners();
  }

  /// formatta le date in gg,mm,aaaa (es. 17/07/2022)
  String formatDateAsDayMonthYear(DateTime? date) {
    if (date == null) {
      return 'Nessuna';
    }
    return formatDate(
      date,
      [dd, '/', mm, '/', yyyy],
    );
  }
}
