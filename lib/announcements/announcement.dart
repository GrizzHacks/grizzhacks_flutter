/// Represents an announcement in the application.
/// TODO: We may want to add a timestamp to the announcement to help order them.
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
}
