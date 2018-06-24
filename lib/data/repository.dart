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

  Future<List> getSponsors() {
    return api.getSponsors();
  }
}
