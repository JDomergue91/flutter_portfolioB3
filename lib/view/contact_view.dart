import 'package:flutter/material.dart';
import '../view/drawer.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  ContactViewState createState() => ContactViewState();
}

class ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _subject = '';
  String _message = '';

  void _simulateSendEmail() {
    // Simulez l'envoi d'un e-mail
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide, montrez un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Votre message a été envoyé !')),
      );
    } else {
      // Si le formulaire n'est pas valide, montrez un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs correctement.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
      ),
      drawer: DrawerView(
        items: [], // Ajoutez ici les éléments de votre menu si nécessaire
        selection: (index) {
          // Logique de sélection ici
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Objet'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un objet';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _subject = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre message';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _message = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _simulateSendEmail,
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}