import 'package:flutter/material.dart';

/// Represents an schedule event throughout the hackathon.
/// TODO: Replace time with actual time?
class Event {
  final String title;
  final String location;
  final String time;

  const Event({
    @required this.title,
    @required this.location,
    @required this.time,
  })  : assert(title != null),
        assert(location != null),
        assert(time != null);
}
