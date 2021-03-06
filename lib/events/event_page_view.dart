import 'event_page_state.dart';
import 'package:flutter/material.dart';
import 'event_tile.dart';

/// This class should not contain any business logic, but only UI related functions and helper methods.
/// The business logic can be found in [EventPageState].
class EventPageView extends EventPageState {
  Widget _buildProgressView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _event = getEvent(index);
        return new EventTile(
          event: _event,
        );
      },
      itemCount: getItemCount(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading()) {
      return _buildProgressView();
    } else {
      return _buildListView();
    }
  }
}