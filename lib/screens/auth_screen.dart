import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterChat/models/auth.dart';
import 'package:flutterChat/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleSubmit(AuthData authData) async {
    try {
      if (authData.isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: authData.email, password: authData.passWord);
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: authData.email, password: authData.passWord);
      }
    } on PlatformException catch (err) {
      final msg = err.message ?? 'Ocorreu um erro! Verifique.';
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,)
      )
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_handleSubmit),
    );
  }
}
