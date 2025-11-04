import 'package:caremixer_technical_assesment/view_models/chatbot/message_view_model.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:flutter/material.dart';

import '../../models/chatbot/message.dart';

class MessageView extends StatelessWidget {
  MessageView({
    super.key,
    required Message message
  }) {
    _messageViewModel = MessageViewModel(message);
  }

  late final MessageViewModel _messageViewModel;

  @override
  Widget build(BuildContext context) {
    AlignmentDirectional align = AlignmentDirectional.centerStart;
    Color colour = ColourPalette.lightPink.asColor();
    if (_messageViewModel.message.userSent) {
      align = AlignmentDirectional.centerEnd;
      colour = ColourPalette.green.asColor();
    }
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(10, 5, 10, 5),
      child: Align(
        alignment: align,
        child: Column(
          children: [
            Align(
              alignment: align,
              child: Text(
                _messageViewModel.displayTime,
                style: TextStyle(fontSize: 10),
              ),
            ),
            Align(
              alignment: align,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: colour),
                    borderRadius: BorderRadius.circular(10),
                    color: colour,
                  ),
                  child: Padding(padding: EdgeInsetsGeometry.fromLTRB(3, 3, 3, 3), child:  Text(
                    _messageViewModel.message.message,
                    style: TextStyle(fontSize: 20),
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
