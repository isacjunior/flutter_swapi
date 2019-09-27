import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  Input({
    @required this.label,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
