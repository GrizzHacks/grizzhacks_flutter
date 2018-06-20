import 'package:grizzhacks_flutter/announcements/announcement.dart';
import 'package:grizzhacks_flutter/events/event.dart';
import 'package:grizzhacks_flutter/sponsors/sponsor.dart';

class GHRepository {
  ///TODO: Replace with real announcements.
  List<Announcement> getAnnouncements() {
    var _results = <Announcement>[];

    _results.add(Announcement(
        title: "Test Announcement 1", subtitle: "Test Subtitle 1"));

    _results.add(Announcement(
        title: "Test Announcement 2", subtitle: "Test Subtitle 2"));

    _results.add(Announcement(
        title: "Test Announcement 3", subtitle: "Test Subtitle 3"));

    return _results;
  }

  ///TODO: Replace with real events.
  List<Event> getEvents() {
    var _results = <Event>[];

    _results
        .add(Event(title: "Workshop 1", location: "EC 100", time: "12:00 PM"));

    _results
        .add(Event(title: "Workshop 2", location: "EC 200", time: "12:00 PM"));

    _results
        .add(Event(title: "Workshop 3", location: "EC 300", time: "12:00 PM"));

    return _results;
  }

  //TODO: Replace with real sponsors.
  List<Sponsor> getSponsors() {
    var _results = <Sponsor>[];

    _results.add(Sponsor(
      name: "Apple",
      logoAsset: "assets/sponsors/apple.jpg",
      description: "We build computers.",
    ));

    _results.add(Sponsor(
      name: "Microsoft",
      logoAsset: "assets/sponsors/microsoft.jpg",
      description: "We build other computers.",
    ));

    _results.add(Sponsor(
      name: "Google",
      logoAsset: "assets/sponsors/google.jpg",
      description: "We search things.",
    ));
    
    _results.add(Sponsor(
      name: "Facebook",
      logoAsset: "assets/sponsors/facebook.png",
      description: "We share things.",
    ));

    return _results;
  }
}
