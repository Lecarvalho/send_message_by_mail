import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_message_by_mail/button_widget.dart';

import 'contact.dart';
import 'controller/message_controller.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Send message by mail sample",
                  style: TextStyle(fontSize: 18),
                ),
                Text("Flutter apps are cool"),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("FEEDBACK"),
          ),
          ButtonWidget(
            title: "Give us a feedback",
            icon: Icons.message,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider(
                      builder: (context) => MessageController(),
                      child: Contact(),
                    );
                  },
                ),
              ).then(
                (messageSent) {
                  if (messageSent)
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Message sent"),
                          content: Text("Thanks for the feedback!\n\nIf you have any more questions, comments, or concerns or compliments, please feel welcome to tell us again."),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Close"),
                            )
                          ],
                        );
                      },
                    );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
