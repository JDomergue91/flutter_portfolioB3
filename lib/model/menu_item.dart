import 'package:flutter/material.dart';

enum MenuType {
  about,
  contact,
}

class MenuItemData {
  String name; 
  Widget view; 

  MenuItemData({required this.name, required this.view});
}