import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final List sugars = ['0','1','2','3','4'];

  String _currentName;
  String _currentSugar;
  String _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.blue[100],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.blue[900],
              alignment: AlignmentDirectional.center,
              child: Text(
                'Update your data',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 19,
                    color: Colors.blue[100]),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: TextInputDecoration.copyWith(hintText: 'Name'),
                validator: (val) => val.isEmpty ? 'Please enter Name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar'),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              ))),
                  onPressed: () {
                    print(_currentName);
                    print(_currentStrength);
                    print(_currentSugar);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(letterSpacing: 2, fontSize: 17),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
