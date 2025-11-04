import 'package:caremixer_technical_assesment/view_models/timeline/timeline_item_view_model.dart';
import 'package:flutter/material.dart';

import '../../view_models/timeline/timeline_item_types.dart';

class TimelineItemView extends StatelessWidget {
  TimelineItemView({
    super.key,
    required timelineItemType,
    last = false,
    messageInsert = "",
    required timestamp,
  }) {
    _itemViewModel = TimelineItemViewModel(timelineItemType, last, messageInsert, timestamp);
  }

  late final TimelineItemViewModel _itemViewModel;

  @override
  Widget build(BuildContext context) {
    Widget? line;
    if (!_itemViewModel.last) {
      line = const VerticalDivider(
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Colors.grey,
      );
    }
    String time = _itemViewModel.displayTime;
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
                  Icon(_itemViewModel.icon, size: 30, color: _itemViewModel.timelineItemType.colour.asColor()),
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
                            _itemViewModel.title,
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
                        child: Text(_itemViewModel.message, style: TextStyle(fontSize: 20)),
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
