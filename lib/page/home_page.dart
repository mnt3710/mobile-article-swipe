import "package:flutter/material.dart";
import 'package:swipe_cards/swipe_cards.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  List<String> _site = ["Qiita", "Zenn", "Qiita", "Qiita"];

  List<String> _title = [
    "Gitを作ってみる（理解編）",
    "Golangで学ぶCookie",
    "Flutterコマンド一覧まとめ",
    "事前に議事録を用意し何ならそこで議論を始めてしまう手法を試している",
  ];

  dynamic _tag = [
    ["Python", "Git", "Rust", "初心者", "作ってみた"],
    ["Go", "Tech"],
    ["Flutter"],
    ["議事録", "チームマネジメント", "HedgeDoc"]
  ];

  List<String> _description = [
    "はじめに都内でひっそり見習いエンジニアをしている@noshishiです。addしてcommitするプログラムの作成を通じて、Gitを内部から理解しようという記事です。",
    "執筆のきっかけ 趣味でGoのアプリケーションで認証用のトークンをCookieにセットする処理を書いていました。Cookie構造体を覗くと色々なプロパティがあり、詳しく調べてみようと思いました。本記事ではまずCookieとは何かを調べ、最終的にGo上でどう扱えば良いのかを検討しましょう。",
    "はじめに Flutterのコマンドラインについてのまとめです。 Android StudioやVSCodeを使えば、普段はあまりコマンドを使うことが無いかもしれませんが…、個 ...",
    "定例ミーティングの準備、どうしていますか？多くのエンジニアがそうであるように、私の所属するチームで毎週定例のミーティングをしています。この記事は、この定例ミーティングに向けてどのような準備をしているかという話です。私の所属するチームは私を含め3人に非常に小規模なチームです。そのため、チーム運営のための実験も比較的簡単に行うことができます。"
  ];

  List<String> _link = [
    "https://qiita.com/noshishi/items/60a6fe7c63097950911b",
    "https://zenn.dev/chillout2san/articles/4868c825158729",
    "https://qiita.com/kurun_pan/items/f9251b1827ce9dca9e14",
    "https://qiita.com/inajob/items/d04ef69eb43c4fba81d8"
  ];

  String _fireData = "aa";

  @override
  void initState() {
    for (int i = 0; i < _title.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(
              title: _title[i],
              tag: _tag[i],
              description: _description[i],
              link: _link[i],
              site: _site[i])));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  void _changeFireData(data) {
    setState(() {
      _fireData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 10),
        Container(
          child: Expanded(
              child: SwipeCards(
            matchEngine: _matchEngine!,
            onStackFinished: () => Text('ok'),
            itemBuilder: (BuildContext context, int index) {
              return CardContent(_swipeItems, index);
            },
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () => print(_title),
              padding: EdgeInsets.all(20),
              color: Color(0x6f3333ff),
              child: Icon(Icons.thumb_down_alt_rounded, color: Colors.white),
              shape: CircleBorder(),
            ),
            MaterialButton(
              onPressed: () => {},
              padding: EdgeInsets.all(20),
              color: Color(0x6fffcc00),
              child: Icon(Icons.favorite, color: Colors.white),
              shape: CircleBorder(),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.all(20),
              color: Color(0x6fff3366),
              child: Icon(Icons.thumb_up_alt_rounded, color: Colors.white),
              shape: CircleBorder(),
            ),
          ],
        ),
        const SizedBox(height: 30),
        MaterialButton(
            onPressed: () => {
                  FirebaseFirestore.instance
                      .collection('airticle')
                      .doc('8yjmATSQ2MM17lGJ1tci')
                      .get()
                      .then((ref) {
                    _changeFireData(ref.get("airticle")[0]["title"]);
                  })
                },
            child: Text("ほげ")),
        Text(_fireData)
      ]),
    );
  }
}

Widget CardContent(List items, int index) {
  return Center(
      child: Container(
          padding: EdgeInsets.all(30),
          child: InkWell(
              onTap: () async {
                final url = Uri.parse(items[index].content.link);
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                }
              },
              child: Container(
                padding: EdgeInsets.all(30),
                width: 380,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black26)),
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(children: [
                      Text(items[index].content.site),
                    ]),
                    SizedBox(height: 10),
                    Text(items[index].content.title,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(children: [
                      for (var i = 0; i < items[index].content.tag.length; i++)
                        Text(
                          '#' + items[index].content.tag[i] + " ",
                          style: TextStyle(color: Colors.black38),
                        ),
                    ]),
                    SizedBox(height: 30),
                    Text(items[index].content.description),
                  ],
                )),
              ))));
}

class Content {
  final String title;
  final String description;
  final List<String> tag;
  final String link;
  final String site;

  Content(
      {required this.title,
      required this.description,
      required this.tag,
      required this.link,
      required this.site});
}
