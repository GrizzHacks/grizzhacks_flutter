import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Represents an announcement in the application.
class Announcement {
  final String title;
  final String subtitle;
  final DateTime time;
  final String type;

  /// Creates an [Announcement] from a JSON object.
  Announcement.fromJson(Map jsonMap)
      : title = jsonMap["title"],
        subtitle = jsonMap["subtitle"],
        time = DateTime.tryParse(jsonMap["time"]),
        type = jsonMap["type"],
        assert(title != null),
        assert(subtitle != null);

  //TODO: Move these out of the announcement
  String displayTime() {
    return DateFormat.jm().add_yMMMd().format(time);
  }

  Icon icon() {
    IconData _iconData;

    switch (type) {
      case "food":
        _iconData = Icons.fastfood;
        break;
      case "tech":
        _iconData = Icons.computer;
        break;
    }

    if (_iconData == null) {
      return null;
    } else {
      return Icon(_iconData);
    }
  }
}
