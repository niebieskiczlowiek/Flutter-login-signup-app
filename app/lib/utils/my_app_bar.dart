import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? leadingFunction;

  const MyAppBar({super.key, required this.title, this.leadingFunction});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed:
                    leadingFunction ??
                    () {
                      Navigator.of(context).pop();
                    },
                iconSize: 30,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 30);
}
