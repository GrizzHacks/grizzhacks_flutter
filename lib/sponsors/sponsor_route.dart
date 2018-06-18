import 'package:flutter/material.dart';
import 'sponsor.dart';
import 'sponsor_tile.dart';
import 'package:grizzhacks_flutter/data/repository.dart';

/// Route that displays a list of sponsors.
class SponsorRoute extends StatefulWidget {
  static const route_name = "/sponsors";
  static const nav_name = "Sponsors";
  final GHRepository repository;

  const SponsorRoute({@required this.repository}) : assert(repository != null);

  @override
  State<StatefulWidget> createState() => new _SponsorRouteState();
}

class _SponsorRouteState extends State<SponsorRoute> {
  List<Sponsor> _sponsors;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sponsors = widget.repository.getSponsors();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _sponsor = _sponsors[index];
        return new SponsorTile(
          sponsor: _sponsor,
        );
      },
      itemCount: _sponsors.length,
    );
  }
}
