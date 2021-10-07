import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapi_wallstreetjournal/components/bottomappbar.dart';
import 'package:newsapi_wallstreetjournal/pages/bookmark.dart';
import 'package:newsapi_wallstreetjournal/pages/mainpage.dart';
import 'package:newsapi_wallstreetjournal/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

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
          bottomNavigationBar: CustomBottomAppBar(
            pageController: pageController,
          ),
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

  PageController pageController;

  @override
  State<Caller> createState() => _CallerState();
}

class _CallerState extends State<Caller> {
  final page1 = mainPage();
  // final page2 = searchPage(searchbarTextController);
  final page3 = bookmarkPage();
  final page4 = profilePage();

  TextEditingController searchbarTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchbarTextController.addListener(printTulisanSearchBar);
  }

  @override
  void dispose() {
    searchbarTextController.dispose();
    super.dispose();
  }

  searchPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchbarTextController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search something',
          fillColor: Colors.grey,
          filled: true,
        ),
      ),
    );
  }

  printTulisanSearchBar() {
    print('tulisan: ${searchbarTextController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: widget.pageController,
        children: [
          page1,
          // page2,
          searchPage(),
          page3,
          page4,
        ],
      ),
    );
  }
}
