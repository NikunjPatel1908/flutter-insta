import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name,int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name' : name,
      'strength' : strength
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot querySnapshot){
    return querySnapshot.documents.map((e){
      return Brew(
        name: e.data['name'] ?? '',
        strength: e.data['strength'] ?? 0,
        sugars: e.data['sugars'] ?? '0'
      );
    }).toList();
  }


  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

}