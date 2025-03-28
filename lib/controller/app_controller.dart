// Packages Flutter
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// // Models
import '../model/menu_item.dart';

// // Views
import 'package:exercice_flutter/view/contact_view.dart';
import 'package:exercice_flutter/view/about_view.dart';
import '../view/home_view.dart';

import '../view/drawer.dart';

class AppController extends StatefulWidget {
  final String title;

  const AppController({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return AppControllerState();
  }
}

@override
class AppControllerState extends State<AppController> {
  int index = 0;


  
  final List<String> titles = ["Front-end", "Back-end", "Gestion de projet"];
  int currentTitleIndex = 0; 
  Timer? timer;
  bool showAllChips = false;

  final List<MenuItemData> menu = [
    MenuItemData(name: "About", view: const AboutView()),
    MenuItemData(name: "Contact", view: const ContactView()),
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      setState(() {
        currentTitleIndex = (currentTitleIndex + 1) % titles.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void selected(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      drawer: DrawerView(
        items: menu,
        selection: selected,
      ),
      body: const HomeView(),
    );
  }
}