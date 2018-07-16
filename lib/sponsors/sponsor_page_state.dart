import 'package:flutter/material.dart';
import 'sponsor_page.dart';
import 'sponsor.dart';
import 'dart:async';

abstract class SponsorPageState extends State<SponsorPage> {
  final _sponsors = <Sponsor>[];

  Future<void> _retrieveSponsors() async {
    final jsonSponsors = await widget.repository.getSponsors();

    if (jsonSponsors != null) {
      final tempSponsors = <Sponsor>[];

      for (var sponsor in jsonSponsors) {
        tempSponsors.add(Sponsor.fromJson(sponsor));
      }

      setState(() {
        _sponsors.clear();
        _sponsors.addAll(tempSponsors);
      });
    }
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_sponsors.isEmpty) {
      await _retrieveSponsors();
    }
  }

  @protected
  int getItemCount() {
    return _sponsors.length;
  }

  @protected
  Sponsor getSponsor(int position) {
    return _sponsors[position];
  }

  @protected
  bool isLoading() {
    return _sponsors.isEmpty;
  }
}