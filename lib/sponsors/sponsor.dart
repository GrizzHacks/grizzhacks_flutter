class Sponsor {
  final String name;
  final String logo;
  final String description;

  Sponsor.fromJson(Map jsonMap)
      : name = jsonMap["name"],
        logo = jsonMap["logo"],
        description = jsonMap["description"],
        assert(name != null),
        assert(logo != null),
        assert(description != null);
}
