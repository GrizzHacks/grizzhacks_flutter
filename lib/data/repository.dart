import 'package:grizzhacks_flutter/events/event.dart';
import 'package:grizzhacks_flutter/sponsors/sponsor.dart';
import 'api.dart';
import 'dart:async';

class GHRepository {
  final GHApi api;

  const GHRepository({this.api}) : assert(api != null);

  Future<List> getAnnouncements() async {
    return api.getAnnouncements();
  }

  Future<List> getEvents() {
    return api.getEvents();
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
