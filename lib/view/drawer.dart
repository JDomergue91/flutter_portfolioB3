import 'package:flutter/material.dart';

import '../model/menu_item.dart';
import 'about_view.dart'; // Assurez-vous d'importer AboutView
import 'contact_view.dart'; // Assurez-vous d'importer ContactView
import '../controller/app_controller.dart'; // Importez AppController
import 'articles_view.dart'; // Assurez-vous d'importer ArticlesView

class DrawerView extends StatelessWidget {
  final List<MenuItemData> items;
  final Function(int)
      selection; // La fonction qui va me permettre de selectionner le widget à afficher

  const DrawerView({super.key, required this.items, required this.selection});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Titre statique
          const DrawerHeader(
            child: Text(
              'Mes pages',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Élément Accueil
          ListTile(
            title: const Text("Accueil"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const AppController(title: 'Domergue Jonathan'),
              ));
            },
          ),
          // Élément About
          ListTile(
            title: const Text("À propos"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutView(),
              ));
            },
          ),
          // Élément Contact
          ListTile(
            title: const Text("Contact"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ContactView(),
              ));
            },
          ),
          ListTile(
            title: const Text('Articles'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticlesView()),
              );
            },
          ),
        ],
      ),
    );
  }
}