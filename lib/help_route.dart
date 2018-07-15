import 'package:flutter/material.dart';

class HelpRoute extends StatefulWidget {
  static const route_name = "/help";
  static const nav_name = "Help";

  @override
  State<StatefulWidget> createState() => new _HelpRouteState();
}

class _HelpRouteState extends State<HelpRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "If you need any assistance during the event, please find an MLH representative, or a GrizzHacks volunteer at the registration table in the atrium.",
          style: TextStyle(
            fontSize: 24.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
