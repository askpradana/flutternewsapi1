import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapi_wallstreetjournal/components/appbar.dart';
import 'package:newsapi_wallstreetjournal/pages/bookmark.dart';
import 'package:newsapi_wallstreetjournal/pages/mainpage.dart';
import 'package:newsapi_wallstreetjournal/pages/profile.dart';
import 'package:newsapi_wallstreetjournal/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black38,
          // backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomAppBar(),
          body: Caller(
            pageController: pageController,
          ),
        ));
  }
}

class Caller extends StatefulWidget {
  Caller({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  PageController pageController = PageController();

  @override
  State<Caller> createState() => _CallerState();
}

class _CallerState extends State<Caller> {
  final page1 = mainPage();
  final page2 = searchPage();
  final page3 = bookmarkPage();
  final page4 = profilePage();

  @override
  void initState() {
    super.initState();
    widget.pageController = PageController();
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: [
          page1,
          page2,
          page3,
          page4,
        ],
      ),
    );
  }
}
