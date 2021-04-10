import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _editMenu(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          child: Text('Hello'),
        );
      }
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text('Home',
            style: TextStyle(
              color: Colors.blue[900],
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.login_outlined, color: Colors.blue[900]),
              label: Text(
                'Sign out',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _editMenu();
              },
              icon: Icon(Icons.edit_outlined, color: Colors.blue[900]),
              label: Text(
                'Edit',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[800],
        body: BrewList(),
      ),
    );
  }
}
