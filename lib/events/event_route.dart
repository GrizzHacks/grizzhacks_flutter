import 'package:flutter/material.dart';
import 'event.dart';
import 'event_tile.dart';
import 'package:grizzhacks_flutter/data/repository.dart';

/// Route that displays a list of events.
class EventRoute extends StatefulWidget {
  static const route_name = "/events";
  static const nav_name = "Events";
  final GHRepository repository;

  const EventRoute({@required this.repository}) : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new _EventRouteState();
}

class _EventRouteState extends State<EventRoute> {
  List<Event> _events;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _events = widget.repository.getEvents();
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
