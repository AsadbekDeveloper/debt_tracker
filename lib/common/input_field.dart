import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final hintText;
  final type;
  final mainController;
  const InputField({
    Key? key,
    required this.mainController,
    this.hintText,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: mainController,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 35, 34, 60),
        ),
      ),
    );
  }
}
