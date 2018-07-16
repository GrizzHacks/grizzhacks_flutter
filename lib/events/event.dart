import 'package:intl/intl.dart';

/// Represents an schedule event throughout the hackathon.
class Event {
  final String title;
  final String location;
  final DateTime time;

  Event.fromJson(Map jsonMap)
      : title = jsonMap["title"],
        location = jsonMap["location"],
        time = DateTime.tryParse(jsonMap["time"]),
        assert(title != null),
        assert(location != null);

  String displayTime() {
    return DateFormat.jm().add_EEEE().format(time);
  }
}
