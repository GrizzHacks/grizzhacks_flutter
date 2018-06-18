import 'package:flutter/material.dart';
import 'event.dart';
import 'event_tile.dart';

/// Route that displays a list of events.
class EventRoute extends StatefulWidget {
  static const route_name = "/events";
  static const nav_name = "Events";

  const EventRoute();

  @override
  State<StatefulWidget> createState() => new _EventRouteState();
}

class _EventRouteState extends State<EventRoute> {
  final _events = <Event>[];

  ///TODO: Replace with real events
  void _getEvents() {
    _events
        .add(Event(title: "Workshop 1", location: "EC 100", time: "12:00 PM"));

    _events
        .add(Event(title: "Workshop 2", location: "EC 200", time: "12:00 PM"));

    _events
        .add(Event(title: "Workshop 3", location: "EC 300", time: "12:00 PM"));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _event = _events[index];
        return new EventTile(
          event: _event,
        );
      },
      itemCount: _events.length,
    );
  }
}
