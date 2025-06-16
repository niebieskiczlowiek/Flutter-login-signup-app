import 'package:app/utils/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'HOME',
        leadingFunction: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },  
      ),
    );
  }
}