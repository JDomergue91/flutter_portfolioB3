import 'package:flutter/material.dart';

import '../model/menu_item.dart';
import 'about_view.dart'; 
import 'contact_view.dart'; 
import '../controller/app_controller.dart'; 
import 'articles_view.dart'; 

class DrawerView extends StatelessWidget {
  final List<MenuItemData> items;
  final Function(int)
      selection; 

  const DrawerView({super.key, required this.items, required this.selection});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          const DrawerHeader(
            child: Text(
              'Mes pages',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          
          ListTile(
            title: const Text("Accueil"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const AppController(title: 'Domergue Jonathan'),
              ));
            },
          ),
          
          ListTile(
            title: const Text("À propos"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutView(),
              ));
            },
          ),
          
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