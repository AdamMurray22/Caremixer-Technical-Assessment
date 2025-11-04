import '../../models/timeline/timeline_datafile.dart';
import '../../models/timeline/timeline_data_point.dart';

class TimelineViewModel
{
  final List<TimelineDataPoint> _timeline = TimeLineDataFile.getTimeline();

  List<TimelineDataPoint> getTimeline()
  {
    return _timeline;
  }
}