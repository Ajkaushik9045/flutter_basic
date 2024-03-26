// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';

class Fristpage extends StatefulWidget {
  const Fristpage({super.key});

  @override
  State<Fristpage> createState() => _FristpageState();
}

class _FristpageState extends State<Fristpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appliaction"),
        backgroundColor: Colors.purple[100],
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Title(
                color: Colors.black,
                child: Text("Drawer"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/HomePage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/SettingPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("C O U N T E R  A P P"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/counter');
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text("C A L C U L A T O R "),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calculator');
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text("T O D O  A P P "),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/toDo');
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
