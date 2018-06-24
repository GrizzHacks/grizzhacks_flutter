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
  static const double height = 300.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(
      color: Colors.black,
    );
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        height: height,
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          //TODO: shape: shape,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.network(
                        widget.sponsor.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            widget.sponsor.name,
                            style: titleStyle,
                          ),
                        ),
                        new Text(
                          widget.sponsor.description,
                          style: descriptionStyle.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
