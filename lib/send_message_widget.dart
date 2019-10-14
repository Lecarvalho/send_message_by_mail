import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_message_by_mail/controller/message_controller.dart';

class SendMessageWidget extends StatefulWidget {
  @override
  _SendMessageWidgetState createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  TextEditingController _controller;
  MessageController _messageController;
  FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _messageController = Provider.of<MessageController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 1.0),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration.collapsed(hintText: "Talk to us"),
                  onSubmitted: (message) => _sendMessage(message),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _sendMessage(_controller.text),
            )
          ],
        ),
      ],
    );
  }

  void _sendMessage(String message) async {
    if (message != "") {
      _messageController.startSendingMessage();
      _controller.clear();
      _focusNode.unfocus();
      await _messageController.sendMessage(message);
      Navigator.of(context).pop(true);
    }
  }
}
