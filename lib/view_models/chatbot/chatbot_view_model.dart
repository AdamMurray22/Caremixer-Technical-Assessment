import 'package:flutter/material.dart';

import '../../models/chatbot/message.dart';
import '../../models/chatbot/messages.dart';

class ChatbotViewModel with ChangeNotifier
{
  final TextEditingController _textFieldController = TextEditingController();
  final Messages _messages = Messages();

  TextEditingController get textFieldController => _textFieldController;
  int get numOfMessages => _messages.count;

  void textSubmitted()
  {
    if (_textFieldController.text == "")
    {
      return;
    }
    _messages.addMessages(Message(_textFieldController.text, DateTime.now(), true));
    _textFieldController.clear();
    notifyListeners();
  }

  Message getMessageAtIndex(int index) => _messages.getMessageAtIndex(index);
}