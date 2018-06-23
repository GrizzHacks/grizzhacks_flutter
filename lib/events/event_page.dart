import 'package:flutter/material.dart';
import 'event_page_view.dart';
import 'package:grizzhacks_flutter/data/repository.dart';

/// Page that displays a list of events. This maintains some static fields that will be used for
/// this page in the navigation drawer, and also the repository for pulling data.
class EventPage extends StatefulWidget {
  static const route_name = "/events";
  static const nav_name = "Events";
  
  final GHRepository repository;

  const EventPage({@required this.repository}) : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new EventPageView();
}
