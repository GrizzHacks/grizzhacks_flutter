import 'package:flutter/material.dart';
import 'event.dart';
import 'event_tile.dart';
import 'package:grizzhacks_flutter/data/repository.dart';
import 'dart:async';

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
  final _events = <Event>[];

  Future<void> _retrieveAnnouncements() async {
    final jsonEvents = await widget.repository.getEvents();

    if (jsonEvents != null) {
      final events = <Event>[];

      for (var event in jsonEvents) {
        events.add(Event.fromJson(event));
      }

      setState(() {
        _events.clear();
        _events.addAll(events);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_events.isEmpty) {
      await _retrieveAnnouncements();
    }
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
