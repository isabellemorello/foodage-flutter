import 'package:foodage_morello/components/new_food_screen/section_type_selection_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  Food({
    this.id,
    this.foodName,
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

  String? id;
  String? foodName;
  String? deadlineDate;
  String? deadlineType = DeadlineType.shortTerm.toString();
  bool? cookedByMe = false;
  String? sectionType = SectionType.Frigo.toString();
  String? sectionIcon;
  List<String>? labelList = [];
  String? shopName = '';
  String? price = '';
  String? note = '';
  String? currentUser = '';

  factory Food.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return Food(
      id: doc.id,
      foodName: data['foodName'] ?? '',
      deadlineDate: data['deadlineDate'] ?? '',
      deadlineType: data['deadlineType'] ?? '',
      cookedByMe: data['cookedByMe'] ?? '',
      sectionType: data['sectionType'] ?? 'SectionType.Frigo.toString()',
      labelList: data['labelList'] ?? [],
      shopName: data['shopName'] ?? '',
      price: data['price'] ?? '',
      note: data['note'] ?? '',
    );
  }
}
