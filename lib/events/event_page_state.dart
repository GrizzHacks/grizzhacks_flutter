import 'event.dart';
import 'event_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// This class should only contain business logic, and have nothing to do with the user interface.
/// All of that belongs in a view class that implements from this.
abstract class EventPageState extends State<EventPage> {
  final _events = <Event>[];

  Future<void> _retrieveEvents() async {
    final jsonEvents = await widget.repository.getEvents();

    if (jsonEvents != null) {
      final tempEvents = <Event>[];

      for (var event in jsonEvents) {
        tempEvents.add(Event.fromJson(event));
      }

      // Will put oldest first.
      tempEvents.sort((first, second) => first.time.compareTo(second.time));

      setState(() {
        _events.clear();
        _events.addAll(tempEvents);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_events.isEmpty) {
      await _retrieveEvents();
    }
  }

  @protected
  int getItemCount() {
    return _events.length;
  }

  @protected
  Event getEvent(int position) {
    return _events[position];
  }

  @protected
  bool isLoading() {
    return _events.isEmpty;
  }
}
