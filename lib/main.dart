import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:grizzhacks_flutter/announcements/announcement_page.dart';
import 'package:grizzhacks_flutter/events/event_page.dart';
import 'package:grizzhacks_flutter/sponsors/sponsor_page.dart';
import 'help_route.dart';
import 'package:grizzhacks_flutter/data/repository.dart';
import 'package:grizzhacks_flutter/data/api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _title = "GrizzHacks 2018";
  final _repository = GHRepository(api: new GHApi());
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
      case EventPage.route_name:
        {
          return EventPage(
            repository: _repository,
          );
        }
      case SponsorPage.route_name:
        {
          return SponsorPage(
            repository: _repository,
          );
        }
      case HelpRoute.route_name:
        {
          return HelpRoute();
        }
      case AnnouncementPage.route_name:
      default:
        {
          return AnnouncementPage(
            repository: _repository,
          );
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
