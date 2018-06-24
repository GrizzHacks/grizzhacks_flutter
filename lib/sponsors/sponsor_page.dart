import 'package:flutter/material.dart';
import 'package:grizzhacks_flutter/data/repository.dart';
import 'sponsor_page_view.dart';

/// Route that displays a list of sponsors.
class SponsorPage extends StatefulWidget {
  static const route_name = "/sponsors";
  static const nav_name = "Sponsors";
  final GHRepository repository;

  const SponsorPage({@required this.repository}) : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new SponsorPageView();
}
