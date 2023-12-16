class Message {
  String msg;
  final MessageType msgType;

  Message({required this.msg, required this.msgType});

  @override
  String toString() => 'Message(msg: $msg, msgType: $msgType)';
}

enum MessageType { user, bot }
