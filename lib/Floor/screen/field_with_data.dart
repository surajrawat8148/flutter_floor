import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:set_state/Floor/database/userDao.dart';

import '../database/user_entity.dart';
import 'customTextField.dart';
import 'listUser.dart';

class FieldWithData extends StatefulWidget {
  final UserDao dao;
  final String? username;
  String? number;
  String? surname;

  FieldWithData({
    Key? key,
    required this.dao,
    required this.username,
    required this.number,
    required this.surname,
  }) : super(key: key);

  @override
  State<FieldWithData> createState() => _FieldWithDataState();
}

class _FieldWithDataState extends State<FieldWithData> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController suranameTextEditingController = TextEditingController();

  TextEditingController numberTextEditingController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    editingController();
    super.initState();
  }

  editingController() {
    nameTextEditingController.text = widget.username!;
    numberTextEditingController.text = widget.number!;
    suranameTextEditingController.text = widget.surname!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floor')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FieldEntry(
              text: 'Name',
              controller: nameTextEditingController,
            ),
            const SizedBox(height: 20),
            FieldEntry(
              text: 'Surname',
              controller: suranameTextEditingController,
            ),
            const SizedBox(height: 20),
            FieldEntry(
              text: 'Number',
              controller: numberTextEditingController,
            ),
            const SizedBox(height: 20),
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
    await widget.dao.updateUser(user);
  }
}
