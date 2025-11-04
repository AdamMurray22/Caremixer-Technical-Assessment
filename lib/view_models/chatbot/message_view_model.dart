import 'package:caremixer_technical_assesment/models/chatbot/message.dart';

class MessageViewModel {

  late final Message message;

  MessageViewModel(this.message);

  /// Returns the time in a display friendly format
  /// If its the same day, then hh:mm
  /// otherwise yyyy:MM:dd
  String get displayTime {
    DateTime referenceTime = DateTime(2025, 11, 03);
    if (message.timestamp.isAfter(referenceTime)) {
      return "${message.timestamp.hour.toString().padLeft(2, "0")}:${message.timestamp.minute.toString().padLeft(2, "0")}";
    } else {
      return "${message.timestamp.year}/${message.timestamp.month.toString().padLeft(2, "0")}/${message.timestamp.day.toString().padLeft(2, "0")}";
    }
  }
}
