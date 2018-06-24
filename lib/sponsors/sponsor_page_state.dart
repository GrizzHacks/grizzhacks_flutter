import 'package:flutter/material.dart';
import 'sponsor_page.dart';
import 'sponsor.dart';

abstract class SponsorPageState extends State<SponsorPage> {
  final _sponsors = <Sponsor>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sponsors.clear();
    _sponsors.addAll(widget.repository.getSponsors());
  }

  @protected
  int getItemCount() {
    return _sponsors.length;
  }

  @protected
  Sponsor getSponsor(int position) {
    return _sponsors[position];
  }
}