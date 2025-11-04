class MessageViewModel {
  final String message;
  final DateTime timestamp;
  final bool userSent;

  MessageViewModel(this.message, this.timestamp, this.userSent);

  String get displayTime {
    DateTime referenceTime = DateTime(2025, 11, 03);
    if (timestamp.isAfter(referenceTime)) {
      return "${timestamp.hour.toString().padLeft(2, "0")}:${timestamp.minute.toString().padLeft(2, "0")}";
    } else {
      return "${timestamp.year}/${timestamp.month.toString().padLeft(2, "0")}/${timestamp.day.toString().padLeft(2, "0")}";
    }
  }
}
