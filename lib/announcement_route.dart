import 'package:flutter/material.dart';
import 'announcement.dart';
import 'announcement_tile.dart';

/// Route that displays a list of announcements.
class AnnouncementRoute extends StatefulWidget {
  static const route_name = "/announcements";
  static const nav_name = "Announcements";

  const AnnouncementRoute();

  @override
  State<StatefulWidget> createState() => new _AnnouncementRouteState();
}

class _AnnouncementRouteState extends State<AnnouncementRoute> {
  final _announcements = <Announcement>[];

  ///TODO: Replace with real announcements
  void _getAnnouncements() {
    _announcements.add(Announcement(
        title: "Test Announcement 1", subtitle: "Test Subtitle 1"));

    _announcements.add(Announcement(
        title: "Test Announcement 2", subtitle: "Test Subtitle 2"));

    _announcements.add(Announcement(
        title: "Test Announcement 3", subtitle: "Test Subtitle 3"));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _announcement = _announcements[index];
        return new AnnouncementTile(
          announcement: _announcement,
        );
      },
      itemCount: _announcements.length,
    );
  }
}
