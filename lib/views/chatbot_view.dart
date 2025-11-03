import 'package:flutter/material.dart';


class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});


  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("Chatbot"),)
    );
  }
}