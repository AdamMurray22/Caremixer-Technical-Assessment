import 'package:caremixer_technical_assesment/view_models/timeline/timeline_item_types.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:caremixer_technical_assesment/views/timeline/timeline_item.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline", style: TextStyle(fontSize: 50, color: ColourPalette.darkGreen.asColor()),)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TimelineItem(
              timelineItemType: TimelineItemTypes.click,
              messageInsert: "Space",
              timestamp: DateTime(2025,11,02,15,5),
            ),
            TimelineItem(
              timelineItemType: TimelineItemTypes.pause,
              messageInsert: "Press",
              timestamp: DateTime(2025,11,03,15,45),
            ),
            TimelineItem(
              timelineItemType: TimelineItemTypes.close,
              last: false,
              timestamp: DateTime(2025,11,03,20,15),
            ),
          ],
        ),
      ),
    );
  }
}