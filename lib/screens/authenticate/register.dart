import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingGreen() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(
          'Sign UP Here',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.login_outlined, color: Colors.green[900]),
            label: Text(
              'Sign In',
              style: TextStyle(color: Colors.green[900]),
            ),
          )
        ],
      ),
      backgroundColor: Colors.green[800],
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
                validator: (val) => val.isEmpty ? 'Enter your email' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: TextInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6 ? 'Enter valid password' : null,
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
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmail(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Please enter valid user name and password';
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.green[900],
                          letterSpacing: 2,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
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
                              .green[200]; // Use the component's default.
                        },
                      ),
                    )),
              ),
              Text(
                error
              )
            ],
          ),
        ),
      ),
    );
  }
}
