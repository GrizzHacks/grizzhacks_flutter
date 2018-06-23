import 'event_page_state.dart';
import 'package:flutter/material.dart';
import 'event_tile.dart';

/// This class should not contain any business logic, but only UI related functions and helper methods.
/// The business logic can be found in [EventPageState].
class EventPageView extends EventPageState {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _event = events[index];
        return new EventTile(
          event: _event,
        );
      },
      itemCount: events.length,
    );
  }
}