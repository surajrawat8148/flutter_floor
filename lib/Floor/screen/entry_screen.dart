import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:set_state/Floor/database/userDao.dart';

import '../database/user_entity.dart';
import 'customTextField.dart';
import 'listUser.dart';

class Entry extends StatefulWidget {
  final UserDao dao;

  Entry({
    Key? key,
    required this.dao,
  }) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController suranameTextEditingController = TextEditingController();

  TextEditingController numberTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: FieldEntry(
                text: 'Name',
                controller: nameTextEditingController,
              ),
            ),
            FieldEntry(
              text: 'Surname',
              controller: suranameTextEditingController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: FieldEntry(
                text: 'Number',
                controller: numberTextEditingController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                buttonPress();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ListOfUser(
                      doa: widget.dao,
                    );
                  },
                ));
              },
              child: const Text('Add User'),
            )
          ],
        ),
      ),
    );
  }

  buttonPress() async {
    final user = User(
        name: nameTextEditingController.text,
        surname: suranameTextEditingController.text,
        mobile: numberTextEditingController.text);
    await widget.dao.insertUser(user);
  }
}
