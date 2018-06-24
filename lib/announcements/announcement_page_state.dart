import 'announcement.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'announcement_page.dart';

/// This class should only contain business logic, and have nothing to do with the user interface.
/// All of that belongs in a view class that implements from this.
abstract class AnnouncementPageState extends State<AnnouncementPage> {
  final _announcements = <Announcement>[];

  Future<void> _retrieveAnnouncements() async {
    final jsonAnnouncements = await widget.repository.getAnnouncements();

    if (jsonAnnouncements != null) {
      final tempAnnouncements = <Announcement>[];

      for (var announcement in jsonAnnouncements) {
        tempAnnouncements.add(Announcement.fromJson(announcement));
      }

      tempAnnouncements.sort((first, second) => first.time.compareTo(second.time));

      setState(() {
        _announcements.clear();
        _announcements.addAll(tempAnnouncements);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_announcements.isEmpty) {
      await _retrieveAnnouncements();
    }
  }

  int getItemCount() {
    return _announcements.length;
  }

  Announcement getAnnouncement(int position) {
    return _announcements[position];
  }
}
