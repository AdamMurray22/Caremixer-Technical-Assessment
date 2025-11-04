import 'package:caremixer_technical_assesment/view_models/timeline/timeline_view_model.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:caremixer_technical_assesment/views/timeline/timeline_item.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  TimelineView({super.key});

  final TimelineViewModel _timelineViewModel = TimelineViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline", style: TextStyle(fontSize: 50, color: ColourPalette.darkGreen.asColor()),)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:
            _getTimelineItems(),
        ),
      ),
    );
  }

  // Converts the timeline data into timeline items
  List<TimelineItem> _getTimelineItems()
  {
    List<TimelineItem> timeLineItems = _timelineViewModel.getTimeline().map((data) =>
        TimelineItem(
          timelineItemType: data.timelineItemTypes,
          timestamp: data.timestamp,
          messageInsert: data.messageInsert ?? "",
        )
    ).toList();
    timeLineItems.removeLast();
    timeLineItems.add(
        TimelineItem(
          timelineItemType: _timelineViewModel.getTimeline().last.timelineItemTypes,
          timestamp: _timelineViewModel.getTimeline().last.timestamp,
          messageInsert: _timelineViewModel.getTimeline().last.messageInsert ?? "",
          last: true,
        ));
    return timeLineItems;
  }
}