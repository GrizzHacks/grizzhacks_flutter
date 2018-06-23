import 'package:flutter/material.dart';
import 'announcement_page_state.dart';
import 'announcement_tile.dart';

/// This class should not contain any business logic, but only UI related functions and helper methods.
/// The business logic can be found in [AnnouncementPageState].
class AnnouncementPageView extends AnnouncementPageState {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _announcement = announcements[index];
        return new AnnouncementTile(
          announcement: _announcement,
        );
      },
      itemCount: announcements.length,
    );
  }
}
