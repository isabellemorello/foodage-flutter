import 'package:flutter/material.dart';

class Label {
  String? icon;
  String? name;

  Label({
    this.icon,
    this.name,
  });
}

var labels = [
  Label(icon: '🍎', name: 'Frutta'), // 0
  Label(icon: '🥦', name: 'Verdura'), // 1
  Label(icon: '🍞', name: 'Panificazione'), // 2
  Label(icon: '🧀', name: 'Latticini'), // 3
  Label(icon: '🥚', name: 'Uova'), // 4
  Label(icon: '🥩', name: 'Carne'), // 5
  Label(icon: '🐟', name: 'Pesce'), // 6
  Label(icon: '🛢', name: 'Scatolame'), // 7
  Label(icon: '🌿', name: 'Condimenti & Spezie'), // 8
  Label(icon: '🥫', name: 'Salse & Sughi pronti'), // 9
  Label(icon: '❄️', name: 'Surgelati'), // 10
  Label(icon: '🍝', name: 'Pasta, Riso & Cereali'), // 11
  Label(icon: '🍰', name: 'Snack & Dolci'), // 12
  Label(icon: '🧃', name: 'Bevande'), // 13
  Label(icon: '🐾', name: 'Animali'), // 14
];
