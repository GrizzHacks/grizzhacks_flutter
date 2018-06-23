import 'package:flutter/material.dart';
import 'dart:async';
import 'announcement_page_state.dart';
import 'announcement_tile.dart';

class AnnouncementPageView extends AnnouncementPageState {
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (announcements.isEmpty) {
      await retrieveAnnouncements();
    }
  }

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
