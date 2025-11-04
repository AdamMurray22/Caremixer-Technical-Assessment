import 'package:flutter/material.dart';

class ChatbotViewModel with ChangeNotifier
{
  final TextEditingController _textFieldController = TextEditingController();

  TextEditingController get textFieldController => _textFieldController;

  void textSubmitted()
  {
    _textFieldController.clear();
    notifyListeners();
  }
}