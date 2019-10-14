import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_message_by_mail/controller/message_controller.dart';
import 'package:send_message_by_mail/drawer_page.dart';
import 'package:send_message_by_mail/message_widget.dart';

import 'send_message_widget.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send us a message"),
      ),
      body: Consumer<MessageController>(
        builder: (context, messageController, child) {
          return Container(
            decoration: !messageController.sendingMessage
                ? _initialContainerDecoration()
                : BoxDecoration(),
            child: Column(
              children: <Widget>[
                messageController.sendingMessage
                    ? _loadingContainer() 
                    : Container(),
                Spacer(),
                SendMessageWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _initialContainerDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/contact_placeholder.png"),
        fit: BoxFit.none,
        alignment: Alignment.topCenter,
      ),
    );
  }

  Widget _loadingContainer() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            width: 125,
            child: Image.asset("assets/loader.gif"),
          ),
          Text("Sending the message"),
        ],
      ),
    );
  }
}

class ListMessagesWidget extends StatelessWidget {
  final List<String> messages;
  const ListMessagesWidget({this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        return MessageWidget(messages[index]);
      },
    );
  }
}
