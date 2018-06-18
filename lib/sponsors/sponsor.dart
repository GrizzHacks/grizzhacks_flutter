import 'package:flutter/material.dart';

class Sponsor {
  final String name;
  final String logo;

  const Sponsor({@required this.name, @required this.logo})
      : assert(name != null),
        assert(logo != null);
}
