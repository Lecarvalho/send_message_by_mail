import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class MessageService {
  Future<void> sendMessage(String message, String userId) async {
    var mailerMessage = createMailerMessage(message, userId);
    var smtpServer =
        gmail(MessageServiceConfig.username, MessageServiceConfig.password);

    try {
      var connection = PersistentConnection(smtpServer);
      final sendReport = await connection.send(mailerMessage);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    await Future.delayed(Duration(seconds: 3));
  }

  Message createMailerMessage(String message, String userId) {
    return Message()
      ..from =
          Address(MessageServiceConfig.username, MessageServiceConfig.appName)
      ..recipients.add(MessageServiceConfig.destinationMail)
      ..subject =
          'Feedback from your app ${MessageServiceConfig.appName} - DevideId: $userId - Local date: ${DateTime.now()}'
      ..text = 'Message sent: $message\nDeviceId: $userId.';
  }
}

class MessageServiceConfig {
  static const String username = 'yourmail@gmail.com';
  static const String password = 'yourpassword';
  static const String destinationMail = "destination@gmail.com";
  static const String appName = "YourAppName";
}
