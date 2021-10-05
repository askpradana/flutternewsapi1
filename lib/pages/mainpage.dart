import 'package:flutter/material.dart';
import 'package:newsapi_wallstreetjournal/components/judul.dart';
import 'package:newsapi_wallstreetjournal/components/newest_story.dart';
import 'package:newsapi_wallstreetjournal/components/recomended_story.dart';

mainPage() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        judulHalaman(),
        ManggilNewStory(),
        untukJudul(),
        ManggilRecommendedStory(),
      ],
    ),
  );
}
