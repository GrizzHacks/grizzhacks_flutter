import 'dart:io';
import 'dart:async';
import 'dart:convert' show json, utf8;

class GHApi {
  final _httpClient = HttpClient();
  final _url =
      "raw.githubusercontent.com";

  /// Retrieves the list of announcements from the server, currently just a JSON file in the GitHub repo.
  Future<List> getAnnouncements() async {
    final uri = Uri.https(_url, "/GrizzHacks/grizzhacks_flutter/master/data/announcements.json");

    final jsonResponse = await _getJson(uri);

    if (jsonResponse == null || jsonResponse["announcements"] == null) {
      print("Error retrieving announcements.");
      return null;
    }

    return jsonResponse["announcements"];
  }

  /// Fetches and decodes a JSON object represented as a Dart [Map].
  ///
  /// Returns null if the API server is down, or the response is not JSON.
  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();

      if (httpResponse.statusCode != HttpStatus.OK) {
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