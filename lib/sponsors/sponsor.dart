import 'package:flutter/material.dart';

class Sponsor {
  final String name;
  final String logoAsset;
  final String description;

  const Sponsor(
      {@required this.name,
      @required this.logoAsset,
      @required this.description})
      : assert(name != null),
        assert(logoAsset != null),
        assert(description != null);
}
