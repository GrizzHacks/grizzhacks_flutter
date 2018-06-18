import 'package:flutter/material.dart';
import 'sponsor.dart';
import 'sponsor_tile.dart';

/// Route that displays a list of sponsors.
class SponsorRoute extends StatefulWidget {
  static const route_name = "/sponsors";
  static const nav_name = "Sponsors";

  const SponsorRoute();

  @override
  State<StatefulWidget> createState() => new _SponsorRouteState();
}

class _SponsorRouteState extends State<SponsorRoute> {
  final _sponsors = <Sponsor>[];

  ///TODO: Replace with real sponsors.
  void _getSponsors() {
    _sponsors.add(Sponsor(name: "Apple", logo: ""));
    _sponsors.add(Sponsor(name: "Microsoft", logo: ""));
    _sponsors.add(Sponsor(name: "Google", logo: ""));
    _sponsors.add(Sponsor(name: "Facebook", logo: ""));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _getSponsors();
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
