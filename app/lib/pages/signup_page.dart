import 'package:app/services/api_service.dart';
import 'package:app/utils/my_app_bar.dart';
import 'package:app/utils/my_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> showMessageNotifier = ValueNotifier(true);
  String errorMessage = "";
  final ApiService apiService = ApiService();

  verifyUser(username) async {
    var users = await apiService.getUsers();
    var foundUser = users.firstWhere(
      (user) => user['username'] == username,
      orElse: () => {},
    );
    return foundUser;
  }

  createUser(username, password) async {
    await apiService.addUser(username, password);
  }

  void submitForm() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    var dbUser = await verifyUser(username);
    if (!mounted) return;

    if (!dbUser.isEmpty) {
      setState(() {
        showMessageNotifier.value = true;
        errorMessage = "This user already exists!";
      });
      return;
    }

    await createUser(username, password);
    if (!mounted) return;
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'SIGN UP'),
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
