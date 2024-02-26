import 'package:flutter/material.dart';
import 'package:lab21_3_floor/database.dart';

import 'user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppDatabase? _database;
  late List<User> _users = [];
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _age;
  late TextEditingController _tel;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _age = TextEditingController();
    _tel = TextEditingController();
    _initDatabase();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _age.dispose();
    _tel.dispose();

    super.dispose();
  }

  void _initDatabase() async {
    _database = await $FloorAppDatabase.databaseBuilder('users.db').build();
    final userDao = _database!.userDao;
    _users = await userDao.finalAllUsers();
    setState(() {});
  }

  void _insertUser(User user) async {
    await _database!.userDao.insertUser(user);
    final userDao = _database!.userDao;
    _users = await userDao.finalAllUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab #21.3 Floor database'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: ListTile(
            title: Text(
                '${_users[index].id} - ${_users[index].firstName} ${_users[index].lastName}'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(controller: _firstName),
                        TextField(controller: _lastName),
                        TextField(controller: _age),
                        TextField(controller: _tel),
                        Row(
                          children: [
                            ElevatedButton(
                              child: const Text('Save'),
                              onPressed: () {
                                _insertUser(
                                  User(
                                      id: _users.length + 1,
                                      firstName: _firstName.text,
                                      lastName: _lastName.text,
                                      age: int.parse(_age.text),
                                      tel: _tel.text),
                                );
                                Navigator.pop(context);
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        tooltip: 'Add user',
        child: const Icon(Icons.add_card),
      ),
    );
  }
}
