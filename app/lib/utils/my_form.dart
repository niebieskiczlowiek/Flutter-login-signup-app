import 'package:app/utils/button.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  final VoidCallback onSubmit;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> showMessageNotifier;
  final String message;

  const MyForm({
    super.key,
    required this.onSubmit,
    required this.usernameController,
    required this.passwordController,
    required this.showMessageNotifier,
    required this.message
  });

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Enter your username';
    }
    return null;
  }

  validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Enter your username';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(-18, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    validateUsername(value);
                    return null;
                  },
                  controller: widget.usernameController,
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(-18, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    validatePassword(value);
                    return null;
                  },
                  controller: widget.passwordController,
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: widget.showMessageNotifier,
              builder: (context, showMessage, _) {
                return showMessage
                    ? Padding(
                      padding: const EdgeInsets.only(left:25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.message, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                      ),
                    )
                    : const SizedBox.shrink();
              },
            ),
            SizedBox(height: 15),
            Button(text: 'SUBMIT', onPressed: widget.onSubmit),
          ],
        ),
      ),
    );
  }
}
