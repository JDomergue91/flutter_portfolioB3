import 'dart:convert';
import 'package:flutter/material.dart';
import '../view/drawer.dart';
import '../view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  ContactViewState createState() => ContactViewState();
}
// on initialise les variables present dans mon formulaire de contact
class ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _subject = '';
  String _message = '';

// party sauvegarde ou l'on va enregistrer les informations données dans le formulaire
  Future<void> _saveContactForm() async {
    final contactData = {
      'name': _name,
      'subject': _subject,
      'message': _message,
    }; 

    // permet de convertire les données en JSON normalement, meme si la ca marche pas ... 
    final jsonString = jsonEncode(contactData);

    // On passe pas le stockage local en et on set up les differents champs
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('contact_form', jsonString);
  }

  Future<void> _loadContactForm() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('contact_form');
    if (jsonString != null) {
      final contactData = jsonDecode(jsonString);
      setState(() {
        _name = contactData['name'];
        _subject = contactData['subject'];
        _message = contactData['message'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadContactForm();
  }

// on simule l'envoie du formulaire pour le valider
  void _simulateSendEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      await Future.delayed(Duration(seconds: 1));

      await _saveContactForm();
 // Message de confirmation si le formulaire c'est bien envoye
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Votre message a été envoyé et sauvegardé !')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else { // message d'erreur si jamais il y a un probleme dans le remplissage des champs
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
        items: [], 
        selection: (index) {
          
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField( // Champ pour le nom 
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
              TextFormField( // champ pour l'objet du message
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
              TextFormField( // champ pour le contenu du message
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