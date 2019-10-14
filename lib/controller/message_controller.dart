import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:send_message_by_mail/service/message_service.dart';

class MessageController extends ChangeNotifier {
  bool sendingMessage = false;
  MessageService _messageService = MessageService();

  void startSendingMessage() {
    sendingMessage = true;
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    var deviceId = await DeviceId.getID;
    await _messageService.sendMessage(message, deviceId);
    sendingMessage = false;
  }
}
