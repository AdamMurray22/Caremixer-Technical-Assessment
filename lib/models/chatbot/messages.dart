import 'message.dart';

class Messages
{
  final List<Message> _messages = [];

  Messages()
  {
    _startUpMessages();
  }

  void _startUpMessages()
  {
    _messages.add(Message("Hi",  DateTime(2025,10,03,05,5), true));
    _messages.add(Message("Hello User.", DateTime(2025,10,03,05,6), false));
  }

  int get count => _messages.length;

  Message getMessageAtIndex(int index) => _messages[index];

  void addMessages(Message message)
  {
    _messages.add(message);
  }
}