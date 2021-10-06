import 'package:flutter/material.dart';
import 'package:newsapi_wallstreetjournal/components/read_story.dart';
import 'package:newsapi_wallstreetjournal/controller/api.dart';
import 'package:newsapi_wallstreetjournal/model/model.dart';

class ManggilRecommendedStory extends StatefulWidget {
  const ManggilRecommendedStory({Key? key}) : super(key: key);

  @override
  _ManggilRecommendedStoryState createState() =>
      _ManggilRecommendedStoryState();
}

class _ManggilRecommendedStoryState extends State<ManggilRecommendedStory> {
  final maprandom = new List<int>.generate(20, (index) => index);
  final minrandom = new List<int>.generate(7, (index) => index);
  late Future<NewsModel> futureNews;

  @override
  void initState() {
    super.initState();
    maprandom.shuffle();
    minrandom.shuffle();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return RekomenStory(
                  gambar: snapshot.data!.articles![maprandom[index]].urlToImage
                      .toString(),
                  judul: snapshot.data!.articles![maprandom[index]].title!,
                  url: snapshot.data!.articles![maprandom[index]].url!,
                  menit: minrandom[index] + 2,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        } else {
          return Text("Load recommended news...");
        }
      },
    );
  }
}

class RekomenStory extends StatefulWidget {
  const RekomenStory({
    Key? key,
    required this.gambar,
    required this.judul,
    required this.url,
    required this.menit,
  }) : super(key: key);
  final String gambar;
  final String judul;
  final String url;
  final int menit;

  @override
  State<RekomenStory> createState() => _RekomenStoryState();
}

class _RekomenStoryState extends State<RekomenStory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: GestureDetector(
        onTap: () {
          handleRead(widget.url);
        },
        child: Card(
          color: Color(0xff1F1F1F),
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Image.network(
                    widget.gambar,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.judul,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "${widget.menit} mins read",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
