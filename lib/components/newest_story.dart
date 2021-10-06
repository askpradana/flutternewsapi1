import 'package:flutter/material.dart';
import 'package:newsapi_wallstreetjournal/components/read_story.dart';
import 'package:newsapi_wallstreetjournal/controller/api.dart';
import 'package:newsapi_wallstreetjournal/model/model.dart';
import 'package:newsapi_wallstreetjournal/pages/read_news.dart';

class ManggilNewStory extends StatefulWidget {
  const ManggilNewStory({Key? key}) : super(key: key);

  @override
  _ManggilNewStoryState createState() => _ManggilNewStoryState();
}

class _ManggilNewStoryState extends State<ManggilNewStory>
    with AutomaticKeepAliveClientMixin {
  //menyimpan state page
  @override
  bool get wantKeepAlive => true;

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
    //menyimpan state page
    super.build(context);
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
                    // author: snapshot.data!.articles![maprandom[index]].author,
                    // publishedAt:
                    //     snapshot.data!.articles[maprandom[index]].publishedAt,
                    url: snapshot.data!.articles[maprandom[index]].url,
                    // content: snapshot.data!.articles[maprandom[index]].content,
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
    // required this.author,
    // required this.publishedAt,
    required this.url,
    // required this.content,
  }) : super(key: key);
  final String gambar;
  final String judul;
  // final String author;
  // final String publishedAt;
  final String url;
  // final String content;
  final int menit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleRead(url);
      },
      child: Container(
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
      ),
    );
  }
}
