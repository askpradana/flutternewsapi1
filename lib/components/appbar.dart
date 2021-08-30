import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  static Color warnaAbu = Color(0xffD6D6D6);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff1F1F1F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            color: warnaAbu,
            icon: Icon(Icons.dashboard),
          ),
          IconButton(
            onPressed: () {},
            color: warnaAbu,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            color: warnaAbu,
            icon: Icon(Icons.bookmark),
          ),
          IconButton(
            onPressed: () {},
            color: warnaAbu,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
