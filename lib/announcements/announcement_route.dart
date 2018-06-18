import 'package:flutter/material.dart';
import 'announcement.dart';
import 'announcement_tile.dart';
import 'package:grizzhacks_flutter/data/repository.dart';

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
  List<Announcement> _announcements;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _announcements = widget.repository.getAnnouncements();
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
