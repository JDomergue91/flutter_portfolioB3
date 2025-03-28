import 'package:flutter/material.dart';
import 'dart:async'; // Import pour Timer

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  // Liste des mots pour le titre dynamique
  final List<String> titles = ["Front-end", "Back-end", "Gestion de projet"];
  int currentTitleIndex = 0; 
  Timer? timer; 
  bool showAllChips = false; 

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/body_main.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      titles[currentTitleIndex],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          color: Colors.white.withOpacity(0.8),
          child: Column(
            children: [
              Text("Compétences", style: TextStyle(fontSize: 24)),
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text("Flutter")),
                  Chip(label: Text("Dart")),
                  Chip(label: Text("React")),
                  Chip(label: Text("Node.js")),
                  Chip(label: Text("SQL")),
                  if (showAllChips) ...[
                    Chip(label: Text("Laravel")),
                    Chip(label: Text("MongoDB")),
                    Chip(label: Text("SASS")),
                    Chip(label: Text("Javascript")),
                    Chip(label: Text("HTML")),
                    Chip(label: Text("CSS")),
                  ],
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllChips = !showAllChips; 
                      });
                    },
                    child: Chip(
                      label: Text(showAllChips ? "Moins" : "..."),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          color: Colors.white.withOpacity(0.8),
          child: Column(
            children: [
              Text("Projets", style: TextStyle(fontSize: 24)),
              ListTile(
                title: Text("Application Mobile"),
                subtitle: Text("Une app mobile développée avec Flutter."),
              ),
              ListTile(
                title: Text("Site Web Portfolio"),
                subtitle: Text("Un portfolio interactif en React.js."),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 