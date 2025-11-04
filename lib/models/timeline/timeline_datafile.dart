import 'package:caremixer_technical_assesment/models/timeline/timeline_data_point.dart';

import '../../view_models/timeline/timeline_item_types.dart';

class TimeLineDataFile {
  static List<TimelineDataPoint> getTimeline() {
    return [
      TimelineDataPoint(
        TimelineItemTypes.click,
        "Space",
        DateTime(2025, 11, 02, 15, 5),
      ),
      TimelineDataPoint(
        TimelineItemTypes.click,
        "Header",
        DateTime(2025, 11, 02, 20, 15),
      ),
      TimelineDataPoint(
        TimelineItemTypes.pause,
        "Hovered",
        DateTime(2025, 11, 02, 20, 20),
      ),
      TimelineDataPoint(
        TimelineItemTypes.click,
        "Footer",
        DateTime(2025, 11, 02, 21, 03),
      ),
      TimelineDataPoint(
        TimelineItemTypes.close,
        null,
        DateTime(2025, 11, 02, 22, 5),
      ),
      TimelineDataPoint(
        TimelineItemTypes.pause,
        "Press",
        DateTime(2025, 11, 03, 15, 45),
      ),
      TimelineDataPoint(
        TimelineItemTypes.close,
        null,
        DateTime(2025, 11, 03, 20, 15),
      ),
      TimelineDataPoint(
        TimelineItemTypes.close,
        null,
        DateTime(2025, 11, 03, 20, 20),
      ),
      TimelineDataPoint(
        TimelineItemTypes.pause,
        "Unselected",
        DateTime(2025, 11, 03, 20, 21),
      ),
      TimelineDataPoint(
        TimelineItemTypes.close,
        null,
        DateTime(2025, 11, 03, 20, 26),
      ),
      TimelineDataPoint(
        TimelineItemTypes.click,
        "Right",
        DateTime(2025, 11, 03, 21, 5),
      ),
      TimelineDataPoint(
        TimelineItemTypes.pause,
        "Selected",
        DateTime(2025, 11, 03, 22, 45),
      ),
      TimelineDataPoint(
        TimelineItemTypes.close,
        null,
        DateTime(2025, 11, 03, 23, 15),
      ),
    ];
  }
}
