import 'package:flutter/material.dart';
import 'package:newsapi_wallstreetjournal/controller/api.dart';
import 'package:newsapi_wallstreetjournal/model/model.dart';

class ManggilNewStory extends StatefulWidget {
  const ManggilNewStory({Key? key}) : super(key: key);

  @override
  _ManggilNewStoryState createState() => _ManggilNewStoryState();
}

class _ManggilNewStoryState extends State<ManggilNewStory> {
  late Future<NewsModel> futureNews;
  final maprandom = new List<int>.generate(20, (index) => index);
  final minrandom = new List<int>.generate(7, (index) => index);

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
    maprandom.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Color(0xff1F1F1F),
      child: FutureBuilder<NewsModel>(
        future: futureNews,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return StoryBaru(
                    gambar: snapshot.data!.articles[maprandom[index]].urlToImage
                        .toString(),
                    judul: snapshot.data!.articles![maprandom[index]].title,
                    menit: minrandom[index] + 2,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Text('Loading News');
          }
        },
      ),
    );
  }
}

class StoryBaru extends StatelessWidget {
  const StoryBaru({
    Key? key,
    required this.gambar,
    required this.judul,
    required this.menit,
  }) : super(key: key);
  final String gambar;
  final String judul;
  final int menit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              gambar,
              fit: BoxFit.fill,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                judul,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              '$menit min read',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
