import 'package:flutter/material.dart';

// Enumération qui représente les éléments du menu
enum MenuType {
  about,
  contact,
}

// Classe qui représente le menu qu'il y aura dans le Drawer
class MenuItemData {
  String name; // Le nom de la vue
  Widget view; // Le widget de la vue qu'on veut afficher

  MenuItemData({required this.name, required this.view});
}