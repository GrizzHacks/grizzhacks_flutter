import 'package:flutter/material.dart';
import 'announcement.dart';

/// A widget that displays an announcement inside a ListTile.
class AnnouncementTile extends StatefulWidget {
  final Announcement announcement;

  const AnnouncementTile({Key key, @required this.announcement})
      : assert(announcement != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => new _AnnouncementTileState();
}

class _AnnouncementTileState extends State<AnnouncementTile> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListTile(
        title: new Text(
          widget.announcement.title,
        ),
        subtitle: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              widget.announcement.subtitle,
            ),
            new Text(
              widget.announcement.displayTime(),
            )
          ],
        ),
        trailing: widget.announcement.icon(),
      ),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
    );
  }
}
