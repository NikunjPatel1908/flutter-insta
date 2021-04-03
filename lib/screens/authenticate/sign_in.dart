import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          'Sign In Here',
          style: TextStyle(
            color: Colors.blue[900],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.how_to_reg_outlined, color: Colors.blue[900]),
            label: Text(
              'Sign Up',
              style: TextStyle(color: Colors.blue[900]),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blue[800],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: TextInputDecoration.copyWith(hintText: 'Email'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  validator: (val) => val.isEmpty ? 'Enter your email' : null),
              SizedBox(height: 20),
              TextFormField(
                  decoration: TextInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) =>
                      val.length < 6 ? 'Enter valid password' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 50),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth
                            .signInWithEmailAndPasswords(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please enter valid user name and password';
                          });
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          return Colors
                              .blue[200]; // Use the component's default.
                        },
                      ),
                    )),
              ),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }
}
