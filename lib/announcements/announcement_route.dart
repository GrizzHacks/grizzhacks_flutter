import 'package:flutter/material.dart';
import 'announcement.dart';
import 'announcement_tile.dart';
import 'package:grizzhacks_flutter/data/repository.dart';
import 'dart:async';

/// Route that displays a list of announcements.
class AnnouncementRoute extends StatefulWidget {
  static const route_name = "/announcements";
  static const nav_name = "Announcements";
  final GHRepository repository;

  const AnnouncementRoute({@required this.repository})
      : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new _AnnouncementRouteState();
}

class _AnnouncementRouteState extends State<AnnouncementRoute> {
  final _announcements = <Announcement>[];

  Future<void> _retrieveAnnouncements() async {
    final jsonAnnouncements = await widget.repository.getAnnouncements();

    if (jsonAnnouncements != null) {
      final announcements = <Announcement>[];

      for (var announcement in jsonAnnouncements) {
        announcements.add(Announcement.fromJson(announcement));
      }

      setState(() {
        _announcements.clear();
        _announcements.addAll(announcements);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_announcements.isEmpty) {
      await _retrieveAnnouncements();
    }
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
