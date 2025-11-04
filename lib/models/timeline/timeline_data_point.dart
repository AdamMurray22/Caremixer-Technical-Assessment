import 'package:caremixer_technical_assesment/view_models/timeline/timeline_item_types.dart';

class TimelineDataPoint
{
  final TimelineItemTypes timelineItemTypes;
  final String? messageInsert;
  final DateTime timestamp;

  const TimelineDataPoint(this.timelineItemTypes, this.messageInsert, this.timestamp);
}