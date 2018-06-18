import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grizzhacks_flutter/announcements/announcement_route.dart';
import 'dart:io';

/// An extension of BottomNavigationBarItem that also contains a route that we want to navigate to when it's selected.
class RouteNavigationBarItem extends BottomNavigationBarItem {
  final String route;

  const RouteNavigationBarItem({
    icon,
    title,
    backgroundColor,
    @required this.route,
  })  : assert(route != null),
        super(icon: icon, title: title, backgroundColor: backgroundColor);
}

/// A stateful widget for displaying a list of navigation items, and a function that outputs when a new
/// route is selected.
class GHNavigationBar extends StatefulWidget {
  final ValueChanged<String> selectedRoute;

  const GHNavigationBar({Key key, @required this.selectedRoute})
      : assert(selectedRoute != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => new _GHNavigationBarState();
}

class _GHNavigationBarState extends State<GHNavigationBar> {
  int _index = 0;

  final _notifications = new RouteNavigationBarItem(
      icon: new Icon(Icons.notifications_active),
      title: new Text(AnnouncementRoute.nav_name),
      backgroundColor: Colors.green,
      route: AnnouncementRoute.route_name);

  final _schedule = new RouteNavigationBarItem(
      icon: new Icon(Icons.calendar_today),
      title: new Text("Schedule"),
      backgroundColor: Colors.red,
      route: "/schedule");

  final _sponsors = new RouteNavigationBarItem(
      icon: new Icon(Icons.favorite),
      title: new Text("Sponsors"),
      backgroundColor: Colors.blue,
      route: "/sponsors");

  final _help = new RouteNavigationBarItem(
      icon: new Icon(Icons.info),
      title: new Text("Help"),
      backgroundColor: Colors.purple,
      route: "/help");

  List<RouteNavigationBarItem> _getItems() {
    return <RouteNavigationBarItem>[
      _notifications,
      _schedule,
      _sponsors,
      _help
    ];
  }

  /// Handles the tap on an item in our navigation bar by setting the selected index, and posting
  /// the route that was clicked.
  void _onNavigationItemTap(int index) {
    setState(() {
      _index = index;
    });

    var route = _getItems()[index].route;
    widget.selectedRoute(route);
  }

  /// Creates our navigation bar dependent on the operating system.
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoTabBar(
            currentIndex: _index,
            onTap: _onNavigationItemTap,
            items: _getItems())
        : BottomNavigationBar(
            currentIndex: _index,
            onTap: _onNavigationItemTap,
            items: _getItems());
  }
}
