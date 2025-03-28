import 'package:flutter/material.dart';
import 'view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue, // definition de la couleur du theme
      ),
      home: HomeView(), // on defini la view de base lors du chargement de l'app
    );
  }
}