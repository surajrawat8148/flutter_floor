import 'package:flutter/material.dart';

class FieldEntry extends StatefulWidget {
  String? text;
  TextEditingController controller;

  FieldEntry({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<FieldEntry> createState() => _FieldEntryState();
}

class _FieldEntryState extends State<FieldEntry> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          filled: true,
          hintText: widget.text,
          hintStyle: const TextStyle(color: Colors.black54)),
    );
  }
}
