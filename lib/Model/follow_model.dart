import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Follow{
  String name;
  Widget icon;

  Follow({required this.name,required this.icon});
}

List<Follow> followlist=[
  Follow(name: 'Library', icon: Icon(Icons.featured_video)),
  Follow(name: 'Saved Stories', icon: Icon(Icons.bookmarks_rounded)),
  Follow(name: 'TV', icon: Icon(Icons.live_tv)),
  Follow(name: 'Sports batting', icon: Icon(Icons.sports_cricket)),
  Follow(name: 'Tenis', icon: Icon(Icons.sports_tennis_sharp)),
];