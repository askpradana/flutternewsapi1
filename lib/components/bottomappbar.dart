import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  static Color warnaAbu = Color(0xffD6D6D6);
  PageController pageController;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff1F1F1F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.pageController.jumpToPage(0);
              });
            },
            color: CustomBottomAppBar.warnaAbu,
            icon: Icon(Icons.dashboard),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.pageController.jumpToPage(1);
              });
            },
            color: CustomBottomAppBar.warnaAbu,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.pageController.jumpToPage(2);
              });
            },
            color: CustomBottomAppBar.warnaAbu,
            icon: Icon(Icons.bookmark),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.pageController.jumpToPage(3);
              });
            },
            color: CustomBottomAppBar.warnaAbu,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
