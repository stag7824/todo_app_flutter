import 'package:flutter/material.dart';
import '../services/firebase_auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = FirebaseAuthService();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _email = value!;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password!";
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      final user = await _authService.signUp(_email, _password);
                      if (user != null) {
                        // Navigate to Home page
                      } else {
                        // Display Error Message
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Sign up failed, Please try again!"),
                          duration: Duration(seconds: 5),
                        ));
                      }
                    }
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
