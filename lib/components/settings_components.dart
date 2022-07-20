import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:foodage_morello/constants/dialog_functions.dart';

// Per cambiare la foto profilo
class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60.0,
      backgroundColor: Colors.teal,
      child: CircleAvatar(
        radius: 57.0,
        backgroundColor: Colors.teal.shade50,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 2.5,
              child: Container(
                child: Icon(
                  Icons.person_sharp,
                  size: 110,
                  color: Colors.teal,
                ),
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 36,
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.teal.shade50,
                child: Container(
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.teal,
                  ),
                  alignment: Alignment.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Per selezionare il tipo di promemoria in base alla sezione
class NotificationBySection extends StatelessWidget {
  final String text;

  NotificationBySection({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Spacer(),
        IconButton(
          onPressed: () => kDialogFeatureNotDeveloped(context),
          icon: Icon(
            Icons.notifications,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}

// Per la finestra di dialogo contenente la spiegazione sui prodotti senza scadenza
class DeadlineFreeAlertDialog extends StatelessWidget {
  const DeadlineFreeAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Prodotti senza scadenza'),
      content: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: [
            TextSpan(text: 'I prodotti senza scadenza ma a '),
            TextSpan(
                text: 'breve termine ',
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    'sono quei prodotti, come frutta e verdura o le pietanze cucinate, che non hanno una scadenza precisa, ma che possono stare in frigo per alcuni giorni. \n\n I prodotti senza scadenza ma a '),
            TextSpan(
                text: 'medio termine ',
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    'sono quei prodotti, come cipolle e patate, che non hanno una scadenza precisa, ma che possono durare diversi giorni.'),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
      elevation: 5,
      backgroundColor: Colors.teal.shade50,
    );
  }
}

// Per scegliere il colore
class BuildColorPicker {
  BuildColorPicker({required this.onColorChanged});

  void Function(Color) onColorChanged;

  buildColorPicker() => BlockPicker(
        pickerColor: Colors.teal,
        availableColors: [
          Colors.green,
          Colors.orange,
          Colors.blue,
          Colors.pink,
          Colors.yellow,
          Colors.cyanAccent,
          Colors.purple,
          Colors.red,
          Colors.deepOrange,
          Colors.teal,
          Colors.indigoAccent,
          Colors.amber,
          Colors.cyan,
          Colors.blueGrey,
          Colors.black,
          Colors.white,
        ],
        onColorChanged: onColorChanged,
      );
}

class PickColor {
  void Function(Color) onColorChanged;

  PickColor({required this.onColorChanged});

  pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.teal.shade50,
          title: Text('Scegli un colore'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildColorPicker(onColorChanged: onColorChanged)
                  .buildColorPicker(),
              TextButton(
                child: Text('SELEZIONA'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
}

// // Per caricare una foto da fotocamera o galleria
// class PickPhotoProfile {
//   Future capture(BuildContext context, void setState) async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.teal.shade50,
//         title: Text('Seleziona foto'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 16),
//               title: Text(
//                 'Da Fotocamera',
//                 style: TextStyle(fontSize: 18),
//               ),
//               leading: Icon(Icons.photo_camera),
//               onTap: () {
//                 pickImage(ImageSource.camera, setState);
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 16),
//               title: Text(
//                 'Da Galleria',
//                 style: TextStyle(fontSize: 18),
//               ),
//               leading: Icon(Icons.image),
//               onTap: () {
//                 pickImage(ImageSource.gallery, setState);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//       routeSettings: RouteSettings(arguments: this),
//     );
//   }

//   File? image;

//   Future pickImage(ImageSource imageFrom, void setState) async {
//     try {
//       final image = await ImagePicker().pickImage(source: imageFrom);
//       if (image == null) return;
//       final imageTemporary = File(image.path);
//       setState;
//       // setState(() {
//       //   this.image = imageTemporary;
//       // });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }
// }
