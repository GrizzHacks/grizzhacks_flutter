import 'event.dart';
import 'event_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// This class should only contain business logic, and have nothing to do with the user interface.
/// All of that belongs in a view class that implements from this.
abstract class EventPageState extends State<EventPage> {
  @protected
  final events = <Event>[];

  Future<void> _retrieveAnnouncements() async {
    final jsonEvents = await widget.repository.getEvents();

    if (jsonEvents != null) {
      final tempEvents = <Event>[];

      for (var event in jsonEvents) {
        tempEvents.add(Event.fromJson(event));
      }

      setState(() {
        events.clear();
        events.addAll(tempEvents);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (events.isEmpty) {
      await _retrieveAnnouncements();
    }
  }
}
