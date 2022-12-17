// ignore_for_file: library_private_types_in_public_api

import 'package:biofresh/providers/ui/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:biofresh/api/loginAPI/index.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);

    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController(text: 'eve.holt@reqres.in');
    TextEditingController passwordController = TextEditingController(text: 'cityslicka');

    void loginButtonPressed() async {
      await Login().login(emailController.text, passwordController.text);
      Navigator.pushNamed(context, '/');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login
                    loginButtonPressed();
                  }
                },
                child: Text('LOGIN'),
              )
            ],
          ),
        ));
  }
}
