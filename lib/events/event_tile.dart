import 'package:flutter/material.dart';
import 'event.dart';

/// A widget that displays an event inside a ListTile.
class EventTile extends StatefulWidget {
  final Event event;

  const EventTile({Key key, @required this.event})
      : assert(event != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => new _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListTile(
        title: new Text(
          widget.event.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              widget.event.location,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            new Text(
              widget.event.displayTime(),
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
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
