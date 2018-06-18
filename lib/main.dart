import 'package:flutter/material.dart';
import 'navigation.dart';
import 'announcement_route.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _title = "GrizzHacks 2018";
  String _route;

  /// Anytime the user clicks a navigation item in our bottom bar, we need to update the route.
  void _navItemSelected(String route) {
    setState(() {
      _route = route;
    });
  }

  /// The body of our scaffold can very depending on the selected route.
  Widget _getBody() {
    switch (_route) {
      case AnnouncementRoute.route_name:
        {
          return AnnouncementRoute();
        }
      default:
        {
          return AnnouncementRoute();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "GrizzHacks",
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text(_title),
        ),
        body: _getBody(),
        bottomNavigationBar: new GHNavigationBar(
          selectedRoute: _navItemSelected,
        ),
      ),
    );
  }
}
