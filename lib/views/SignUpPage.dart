import 'package:flutter/material.dart';
import '../services/firebase_auth_service.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();

}
class _SignUpPageState extends State<SignUpPage>{
  final _formKey =GlobalKey<FormState>();
  final _authService= FirebaseAuthService();

  String _email='';
  String _password='';
  

}