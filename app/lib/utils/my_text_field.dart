import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? Function(String?) validator;
  final TextEditingController controler;
  final String hintText;
  final Icon icon;
  final bool obscurable;

  const MyTextField({
    super.key,
    required this.validator,
    required this.controler,
    required this.hintText,
    required this.icon,
    required this.obscurable,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _isObscured;

  toggleText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscurable;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: widget.icon,
        border: const OutlineInputBorder(),
        suffixIcon: widget.obscurable ? 
        IconButton(
          onPressed: toggleText,
          icon: _isObscured 
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        ) : SizedBox.shrink()
      ),
      validator: widget.validator,
      controller: widget.controler,
    );
  }
}
