import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BacaBerita extends StatefulWidget {
  const BacaBerita({
    Key? key,
    required this.judul,
    required this.gambar,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.content,
  }) : super(key: key);
  final String gambar;
  final String judul;
  final String author;
  final String publishedAt;
  final String url;
  final String content;

  @override
  State<BacaBerita> createState() => _BacaBeritaState();
}

class _BacaBeritaState extends State<BacaBerita> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

    return Scaffold(
        body: ListView(
      children: [
        Image.network(widget.gambar),
        Text(widget.judul),
        Text('pemisah'),
        Text(widget.publishedAt),
        Text(widget.author),
        Text(widget.content),
        // ElevatedButton(
        //   onPressed: () {},
        //   child: Text("Button"),
        // ),
      ],
    ));
  }
}
