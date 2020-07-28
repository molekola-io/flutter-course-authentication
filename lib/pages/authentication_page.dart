import 'package:flutter/material.dart';
import 'package:molekola/main.dart';
import 'package:molekola/services/authentication_service.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  // Form -> GlobalKey per accedere agli elementi di un form
  final _formKey = GlobalKey<FormState>();

  // Email
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();

  // Password
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
          ),
          Image(
            image: AssetImage('assets/images/molekola-logo.png'),
            width: 200,
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          // Email
          TextFormField(
            autofocus: true,
            controller: _emailController,
            focusNode: _emailFocus,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (term) {
              _emailFocus.unfocus();
              FocusScope.of(context).requestFocus(_passwordFocus);
            },
            decoration: InputDecoration(
                labelText: "Email",
                helperText: "Please insert here your email"),
            validator: (value) {
              if (value.isEmpty) return "Please insert here your email";
              return null;
            },
          ),

          // Password
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordFocus,
            obscureText: true,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (term) {
              _passwordFocus.unfocus();
              _authenticate();
            },
            decoration: InputDecoration(
                labelText: "Password",
                helperText: "Please insert your password"),
            validator: (value) {
              if (value.isEmpty) return "Please insert your password";
              return null;
            },
          )
        ],
      )),
    );
  }

  Future<void> _authenticate() {
    try {
      AuthenticationService.authenticate(
          _emailController.text, _passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage(
                    title: "Home Page",
                  )));
    } catch (e) {}
  }
}
