import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  String name = 'Suraj';
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          toggle = !toggle;
          name = toggle ? "Suraj" : "Rawat";
        });
      },
      title: Text(name),
      leading: const Text("2"),
    );
  }
}
