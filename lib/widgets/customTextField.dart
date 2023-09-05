import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class customTextField extends StatefulWidget {
  customTextField({
    super.key,
    required this.hint,
    required this.OnChanged,
    this.obscureText = false,
    required this.color,
  });
  final String hint;
  final void Function(String)? OnChanged;
  bool obscureText;
  final Color color;
  @override
  State<customTextField> createState() => _customTextFieldState();
}

// ignore: camel_case_types
class _customTextFieldState extends State<customTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      onChanged: widget.OnChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your ${widget.hint}';
        }
        return null;
      },
      onSaved: (value) {
        //_email = value;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.color,
        hintText: widget.hint,
        suffixIcon: widget.hint == 'Password'
            ? IconButton(
                onPressed: () =>
                    setState(() => widget.obscureText = !widget.obscureText),
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, color: widget.color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, color: widget.color),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, color: widget.color),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, color: widget.color),
        ),
      ),
    );
  }
}
