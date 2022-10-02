import 'package:flutter/material.dart';
import 'package:set_state/Floor/database/database.dart';
import 'package:set_state/Floor/database/user_entity.dart';
import 'package:set_state/list.dart';

import 'Floor/database/userDao.dart';
import 'Floor/screen/entry_screen.dart';
import 'Floor/screen/field_with_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final dao = database.userDoa;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final UserDao dao;
  const MyApp({required this.dao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Entry(
          dao: dao,

          // username: null,
          // number: null,
        )
        // const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            listTile('A', '1'),
            ListData(),
            listTile('B', '3'),
          ],
        ));
  }

  Widget listTile(title, no) {
    return ListTile(
      title: Text(title),
      leading: Text(no),
    );
  }
}
