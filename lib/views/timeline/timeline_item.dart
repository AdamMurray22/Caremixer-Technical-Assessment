import 'package:flutter/material.dart';

import '../../view_models/timeline/timeline_item_types.dart';

class TimelineItem extends StatelessWidget {
  TimelineItem({
    super.key,
    required this.timelineItemType,
    this.last = false,
    this.messageInsert = "",
    required this.timestamp,
  }) {
    _icon = timelineItemType.icon;
    _title = timelineItemType.title;
    _message = timelineItemType.messageTemplate.replaceAll("%%", messageInsert);
  }

  final TimelineItemTypes timelineItemType;
  late final IconData _icon;
  late final String _title;
  late final String _message;
  final bool last;
  final String messageInsert;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    Widget? line;
    if (!last) {
      line = const VerticalDivider(
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Colors.grey,
      );
    }
    String time = "";
    DateTime referenceTime = DateTime(2025, 11, 03);
    if (timestamp.isAfter(referenceTime)) {
      time =
          "${timestamp.hour.toString().padLeft(2, "0")}:${timestamp.minute.toString().padLeft(2, "0")}";
    } else {
      time =
          "${timestamp.year}/${timestamp.month.toString().padLeft(2, "0")}/${timestamp.day.toString().padLeft(2, "0")}";
    }
    return Container(
      constraints: BoxConstraints(minWidth: MediaQuery.sizeOf(context).width),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Icon(_icon, size: 30, color: timelineItemType.colour.asColor()),
                  SizedBox(height: 60, child: line),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width * 0.5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _title,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(time),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(_message, style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
