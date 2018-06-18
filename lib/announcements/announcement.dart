import 'package:flutter/material.dart';

/// Represents an announcement in the application.
/// TODO: We may want to add a timestamp to the announcement to help order them.
class Announcement {
  final String title;
  final String subtitle;

  const Announcement({@required this.title, this.subtitle})
      : assert(title != null);
}
