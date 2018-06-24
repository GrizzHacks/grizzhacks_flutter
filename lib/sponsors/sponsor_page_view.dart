import 'package:flutter/material.dart';
import 'sponsor_page_state.dart';
import 'sponsor_tile.dart';

class SponsorPageView extends SponsorPageState {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var _sponsor = getSponsor(index);
        return new SponsorTile(
          sponsor: _sponsor,
        );
      },
      itemCount: getItemCount(),
    );
  }
}