/// Represents an schedule event throughout the hackathon.
class Event {
  final String title;
  final String location;
  final String time;

  Event.fromJson(Map jsonMap)
      : title = jsonMap["title"],
        location = jsonMap["location"],
        time = jsonMap["time"],
        assert(title != null),
        assert(location != null),
        assert(time != null);
}
