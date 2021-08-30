import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:newsapi_wallstreetjournal/components/appbar.dart';
import 'package:newsapi_wallstreetjournal/components/judul.dart';
import 'package:newsapi_wallstreetjournal/components/newest_story.dart';
import 'package:newsapi_wallstreetjournal/components/recomended_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black38,
          bottomNavigationBar: CustomBottomAppBar(),
          body: SafeArea(
              child: Container(
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
          )),
        ));
  }
}
