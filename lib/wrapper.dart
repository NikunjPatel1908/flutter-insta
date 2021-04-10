import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'file:///C:/Users/Nikunj%20Patel/AndroidStudioProjects/brew_crew/lib/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user  == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
