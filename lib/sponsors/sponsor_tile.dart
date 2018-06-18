import 'package:flutter/material.dart';
import 'sponsor.dart';

/// Displays a sponsor item.
class SponsorTile extends StatefulWidget {
  final Sponsor sponsor;

  const SponsorTile({Key key, @required this.sponsor})
      : assert(sponsor != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => new _SponsorTileState();
}

class _SponsorTileState extends State<SponsorTile> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListTile(
        title: new Text(
          widget.sponsor.name,
        ),
      ),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(),
        ),
      ),
    );
  }
}
