import 'package:intl/intl.dart';

/// Represents an announcement in the application.
class Announcement {
  final String title;
  final String subtitle;
  final DateTime time;

  /// Creates an [Announcement] from a JSON object.
  Announcement.fromJson(Map jsonMap)
      : title = jsonMap["title"],
        subtitle = jsonMap["subtitle"],
        time = DateTime.tryParse(jsonMap["time"]),
        assert(title != null),
        assert(subtitle != null);

  String displayTime() {
    return DateFormat.jm().add_yMMMd().format(time);
  }
}
