import 'package:caremixer_technical_assesment/view_models/timeline/timeline_item_types.dart';
import 'package:flutter/material.dart';

class TimelineItemViewModel {
  final TimelineItemTypes timelineItemType;
  late final IconData icon;
  late final String title;
  late final String message;
  final bool last;
  final String messageInsert;
  final DateTime timestamp;

  TimelineItemViewModel(this.timelineItemType, this.last, this.messageInsert, this.timestamp)
  {
    icon = timelineItemType.icon;
    title = timelineItemType.title;
    message = timelineItemType.messageTemplate.replaceAll("%%", messageInsert);
  }

  /// Returns the time in a display friendly format
  /// If its the same day, then hh:mm
  /// otherwise yyyy:MM:dd
  String get displayTime {
    DateTime referenceTime = DateTime(2025, 11, 03);
    if (timestamp.isAfter(referenceTime)) {
      return "${timestamp.hour.toString().padLeft(2, "0")}:${timestamp.minute.toString().padLeft(2, "0")}";
    } else {
      return "${timestamp.year}/${timestamp.month.toString().padLeft(2, "0")}/${timestamp.day.toString().padLeft(2, "0")}";
    }
  }
}