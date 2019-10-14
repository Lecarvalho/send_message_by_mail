class MessageService {

  Future<void> sendMessage(String message, String userId) async {
    await Future.delayed(Duration(seconds: 3));    
  }
}
