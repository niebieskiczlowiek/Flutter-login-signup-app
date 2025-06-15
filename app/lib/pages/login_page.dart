import 'package:app/services/api_service.dart';
import 'package:app/utils/my_app_bar.dart';
import 'package:app/utils/my_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> showMessageNotifier = ValueNotifier(false);
  String errorMessage = "Incorrect credentials";
  final ApiService apiService = ApiService();

  verifyUser(username) async {
    var users = await apiService.getUsers();
    var foundUser = users.firstWhere(
      (user) => user['username'] == username,
      orElse: () => {},
    );
    return foundUser;
  }

  void submitForm() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    var dbUser = await verifyUser(username);
    if (!mounted) return;

    if (dbUser.isEmpty) {
      setState(() {
        showMessageNotifier.value = true;
      });
      return;
    }

    if (dbUser['password'] != password) {
      setState(() {
        showMessageNotifier.value = true;
      });
      return;
    }

    setState(() {
      showMessageNotifier.value = false;
    });

    if (!mounted) return;
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'LOGIN'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyForm(
              onSubmit: submitForm,
              usernameController: _usernameController,
              passwordController: _passwordController,
              showMessageNotifier: showMessageNotifier,
              message: errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}
