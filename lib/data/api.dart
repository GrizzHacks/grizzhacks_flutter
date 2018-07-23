import 'dart:io';
import 'dart:async';
import 'dart:convert' show json, utf8;

class GHApi {
  final _httpClient = HttpClient();
  final _url = "grizzhacksou.herokuapp.com";

  /// Retrieves the list of announcements from the server, currently just a JSON file in the GitHub repo.
  Future<List> getAnnouncements() async {
    final uri = Uri.https(
        _url, "/announcements");

    final jsonResponse = await _getJson(uri);

    if (jsonResponse == null || jsonResponse["announcements"] == null) {
      print("Error retrieving announcements.");
      return null;
    }

    return jsonResponse["announcements"];
  }

  /// Retrieves the list of events from the server, currently just a JSON file in the GitHub repo.
  Future<List> getEvents() async {
    final uri = Uri.https(
        _url, "/events");

    final jsonResponse = await _getJson(uri);

    if (jsonResponse == null || jsonResponse["events"] == null) {
      print("Error retrieving events.");
      return null;
    }

    return jsonResponse["events"];
  }

  /// Retrieves the list of sponsors from the server, currently just a JSON file in the GitHub repo.
  Future<List> getSponsors() async {
    final uri = Uri.https(
        _url, "/sponsors");

    final jsonResponse = await _getJson(uri);

    if (jsonResponse == null || jsonResponse["sponsors"] == null) {
      print("Error retrieving sponsors.");
      return null;
    }

    return jsonResponse["sponsors"];
  }

  /// Fetches and decodes a JSON object represented as a Dart [Map].
  ///
  /// Returns null if the API server is down, or the response is not JSON.
  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }

      // The response is sent as a Stream of bytes that we need to convert to a
      // `String`.
      final responseBody = await httpResponse.transform(utf8.decoder).join();

      // Finally, the string is parsed into a JSON object.
      return json.decode(responseBody);
    } on Exception catch (e) {
      print("$e");
      return null;
    }
  }
}
