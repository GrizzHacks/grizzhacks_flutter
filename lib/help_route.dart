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
      child: Text("Coming Soon!"),
    );
  }
}
