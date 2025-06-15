import 'package:app/utils/button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // two buttons: login, signup
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Button(
                  text: "LOGIN",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Button(
                  text: "SIGN UP", 
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
