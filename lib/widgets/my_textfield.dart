import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? iconPassword;
  const MyTextField(
      {Key? key,
        required this.label,
        required this.controller,
        required this.obscureText, this.iconPassword})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: widget.obscureText ? isVisible : false,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: widget.obscureText ? IconButton(
              icon: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                isVisible = !isVisible;
                setState(() {});
              },
            ) : const SizedBox(),
            labelText: widget.label,
            labelStyle: GoogleFonts.getFont('Lato', fontSize: 12),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue))));
  }
}

