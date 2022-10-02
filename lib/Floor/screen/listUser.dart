import 'package:flutter/material.dart';
import 'package:set_state/Floor/database/userDao.dart';

import '../database/database.dart';
import '../database/user_entity.dart';
import 'field_with_data.dart';

class ListOfUser extends StatefulWidget {
  final UserDao doa;
  ListOfUser({Key? key, required this.doa}) : super(key: key);

  @override
  State<ListOfUser> createState() => _ListOfUserState();
}

class _ListOfUserState extends State<ListOfUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: widget.doa.findAllUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          var listOfUser = snapshot.data as List<User>;
          return ListView.builder(
              itemCount: listOfUser != null ? listOfUser.length : 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${listOfUser[index].name}'),
                  subtitle: Text('${listOfUser[index].mobile}'),
                  trailing: IconButton(
                    onPressed: () async {
                      final delete = listOfUser[index];

                      await widget.doa.deleteUser(delete);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 36.0,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () async {
                      final list = listOfUser[index];

                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return FieldWithData(
                              dao: widget.doa,
                              username: list.name,
                              number: list.mobile,
                              surname: list.surname);
                        },
                      ));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                      size: 36.0,
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
