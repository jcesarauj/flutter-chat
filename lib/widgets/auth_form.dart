import 'package:flutter/material.dart';
import 'package:flutterChat/models/auth.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  AuthData _authData = AuthData();
  final GlobalKey<FormState> _formKey = GlobalKey();

  _submit() {
    bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                if (_authData.isSignUp)
                  TextFormField(
                    key: ValueKey("Name"),
                    decoration: InputDecoration(
                      labelText: "Nome",
                    ),
                    onChanged: (value) => _authData.name = value,
                    validator: (value) {
                      if (value == null || value.contains("@")) {
                        return 'Forneça um email válido';
                      }
                      return null;
                    },
                  ),
                TextFormField(
                  key: ValueKey("Email"),
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  onChanged: (value) => _authData.email = value,
                  validator: (value) {
                    if (value == null) {
                      return 'Email não pode ser nulo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: ValueKey("Pass"),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                  ),
                  onChanged: (value) => _authData.passWord = value,
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'Senha não deve conter menos que 5 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                RaisedButton(
                    child: Text(_authData.isLogin ? "Entrar" : "Cadastrar"),
                    onPressed: _submit),
                FlatButton(
                    child: Text("Criar nova conta?"),
                    onPressed: () {
                      setState(() {
                        _authData.toogleMode();
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
