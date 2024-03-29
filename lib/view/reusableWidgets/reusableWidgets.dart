import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon,
    TextEditingController? controller) {
  return TextField(
    controller: controller,
    enableSuggestions: true,
    autocorrect: true,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 1, style: BorderStyle.solid)),
    ),
    keyboardType: TextInputType.emailAddress,
  );
}

class PasswordTextFormField extends StatefulWidget {
  final String? hintText;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController passwordEditingController;

  const PasswordTextFormField({
    super.key,
    this.hintText,
    required this.labelText,
    required this.passwordEditingController,
    required this.validator,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordEditingController,
      obscureText: _isPasswordHide,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black.withOpacity(0.9)),
      // maxLength: 20,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 1, style: BorderStyle.solid)),
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.password, color: Colors.black),
        suffixIcon: IconButton(
          tooltip: 'Visible/Hide password',
          onPressed: () {
            _isPasswordHide = !_isPasswordHide;
            setState(() {});
          },
          icon: Visibility(
            visible: _isPasswordHide,
            replacement: const Icon(Icons.visibility),
            child: const Icon(Icons.visibility_off),
          ),
        ),
      ),
      validator: widget.validator,
      keyboardType: TextInputType.text,
    );
  }
}
