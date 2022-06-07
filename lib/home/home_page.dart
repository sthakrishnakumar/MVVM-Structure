import 'package:flutter/material.dart';
import 'package:new_structure_learning/home/user_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          UserListPage(),
        ],
      ),
    );
  }
}
