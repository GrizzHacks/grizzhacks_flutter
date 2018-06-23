import 'announcement.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'announcement_page.dart';

abstract class AnnouncementPageState extends State<AnnouncementPage> {
  @protected
  final announcements = <Announcement>[];

  @protected
  Future<void> retrieveAnnouncements() async {
    final jsonAnnouncements = await widget.repository.getAnnouncements();

    if (jsonAnnouncements != null) {
      final tempAnnouncements = <Announcement>[];

      for (var announcement in jsonAnnouncements) {
        tempAnnouncements.add(Announcement.fromJson(announcement));
      }

      setState(() {
        announcements.clear();
        announcements.addAll(tempAnnouncements);
      });
    }
  }
}
