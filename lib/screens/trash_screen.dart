import 'package:flutter/material.dart';
import 'package:foodage_morello/components/homepage_screen/drawer.dart';

class TrashScreen extends StatelessWidget {
  static const String id = 'trash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Cestino'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal.shade50,
      ),
    );
  }
}
