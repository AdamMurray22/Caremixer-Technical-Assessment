import 'package:caremixer_technical_assesment/view_models/chatbot/chatbot_view_model.dart';
import 'package:caremixer_technical_assesment/views/chatbot/message_view.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:flutter/material.dart';

class ChatbotView extends StatelessWidget {
  ChatbotView({super.key});

  final ChatbotViewModel _chatbotViewModel = ChatbotViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chatbot",
          style: TextStyle(
            fontSize: 50,
            color: ColourPalette.darkRed.asColor(),
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: _chatbotViewModel,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                _getMessages(),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _chatbotViewModel.textFieldController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ask me anything!',
                    ),
                    onSubmitted: (value) {
                      _chatbotViewModel.textSubmitted();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getMessages()
  {
    return Column(
      children: [
        MessageView(message: "Hi", timestamp: DateTime(2025,11,04,05,5), userSent: true),
        MessageView(message: "Hello User.", timestamp: DateTime(2025,11,04,05,6), userSent: false),
      ],
    );
  }
}
