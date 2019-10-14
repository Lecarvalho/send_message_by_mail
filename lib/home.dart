import 'package:flutter/material.dart';
import 'package:send_message_by_mail/drawer_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text("Open the menu and click on the feedback button.", style: TextStyle(fontSize: 25),),
        ),
      ),
    );
  }
}
