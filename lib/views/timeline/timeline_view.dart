import 'package:caremixer_technical_assesment/views/timeline/timeline_item.dart';
import 'package:flutter/material.dart';


class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timeline")),
        body: Scrollbar(child: Column(
            children: [TimelineItem()],
        ))
    );
  }
}