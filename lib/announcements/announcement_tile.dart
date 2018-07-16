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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              widget.announcement.subtitle,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            new Text(
              widget.announcement.displayTime(),
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
        leading: Icon(
          widget.announcement.iconData(),
          color: Colors.black,
        ),
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
