import 'package:flutter/material.dart';
import 'drawer.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Creation de la page 'A propos' 
      appBar: AppBar(
        title: const Text("À propos"),
      ),
      drawer: DrawerView(
        items: [], 
        selection: (index) {
          
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "À propos de cette application",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Cette application Flutter est un portfolio qui présente les projets et compétences de Jonathan Domergue. "
              "Elle utilise un design moderne et une navigation fluide grâce à un menu latéral.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Fonctionnalités :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "- Navigation entre différentes pages\n"
              "- Affichage d'informations sur les projets\n"
              "- Design réactif et moderne",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Image( // on place une image sur la page
                image: AssetImage('assets/images/body_main.jpg'),
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}