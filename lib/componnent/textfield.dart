import 'package:flutter/material.dart'
    show
        BorderSide,
        BuildContext,
        Colors,
        EdgeInsets,
        InputDecoration,
        OutlineInputBorder,
        Padding,
        StatelessWidget,
        TextFormField,
        TextInputType,
        Widget;

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.keyboradType,
      this.obscureText = false,
      this.onChanged,
      this.onFieldSubmitted});
  String labelText;
  String hintText;
  TextInputType keyboradType;
  bool obscureText;
  void Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        keyboardType: keyboradType,
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      ),
    );
  }
}
