import 'package:flutter/material.dart';
import 'sponsor_page_state.dart';
import 'sponsor_tile.dart';

class SponsorPageView extends SponsorPageState {
  Widget _buildProgressView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView() {
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

  @override
  Widget build(BuildContext context) {
    if (isLoading()) {
      return _buildProgressView();
    } else {
      return _buildListView();
    }
  }
}