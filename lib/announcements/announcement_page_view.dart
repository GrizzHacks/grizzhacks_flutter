import 'package:flutter/material.dart';
import 'announcement_page_state.dart';
import 'announcement_tile.dart';

/// This class should not contain any business logic, but only UI related functions and helper methods.
/// The business logic can be found in [AnnouncementPageState].
class AnnouncementPageView extends AnnouncementPageState {
  Widget _buildProgressView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _announcement = getAnnouncement(index);
        return new AnnouncementTile(
          announcement: _announcement,
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
