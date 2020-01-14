import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pokemon with ChangeNotifier {
  Pokemon(this._name);
  String _name;
  String get name => this._name;

  void all() {
    Firestore.instance.collection('pokemons').getDocuments();
  }

  void find(String documentId) async {
    await Firestore.instance
        .collection('pokemons')
        .document(documentId)
        .get()
        .then((document) => _name = document['name']);
    notifyListeners();
  }
}
