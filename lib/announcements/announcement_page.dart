import 'package:flutter/material.dart';
import 'package:grizzhacks_flutter/data/repository.dart';
import 'announcement_page_view.dart';

/// Page that displays a list of announcements. This maintains some static fields that will be used for
/// this page in the navigation drawer, and also the repository for pulling data.
class AnnouncementPage extends StatefulWidget {
  static const route_name = "/announcements";
  static const nav_name = "Announcements";

  final GHRepository repository;

  const AnnouncementPage({@required this.repository})
      : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new AnnouncementPageView();
}
