import "package:flutter/material.dart";

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPage createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  List<String> _site = ["Qiita", "Zenn", "Qiita", "Qiita", "Zenn"];

  List<String> _title = [
    "Gitを作ってみる（理解編）",
    "Golangで学ぶCookie",
    "Flutterコマンド一覧まとめ",
    "事前に議事録を用意し何ならそこで議論を始めてしまう手法を試している",
    "OpenCVをNPPにした結果→10倍高速に！",
  ];

  dynamic _tag = [
    ["Python", "Git", "Rust", "初心者", "作ってみた"],
    ["Go", "Tech"],
    ["Flutter"],
    ["議事録", "チームマネジメント", "HedgeDoc"],
    ["C++", "OpenCV"]
  ];

  List<String> _description = [
    "はじめに都内でひっそり見習いエンジニアをしている@noshishiです。addしてcommitするプログラムの作成を通じて、Gitを内部から理解しようという記事です。",
    "執筆のきっかけ 趣味でGoのアプリケーションで認証用のトークンをCookieにセットする処理を書いていました。Cookie構造体を覗くと色々なプロパティがあり、詳しく調べてみようと思いました。本記事ではまずCookieとは何かを調べ、最終的にGo上でどう扱えば良いのかを検討しましょう。",
    "はじめに Flutterのコマンドラインについてのまとめです。 Android StudioやVSCodeを使えば、普段はあまりコマンドを使うことが無いかもしれませんが…、個 ...",
    "定例ミーティングの準備、どうしていますか？多くのエンジニアがそうであるように、私の所属するチームで毎週定例のミーティングをしています。この記事は、この定例ミーティングに向けてどのような準備をしているかという話です。私の所属するチームは私を含め3人に非常に小規模なチームです。そのため、チーム運営のための実験も比較的簡単に行うことができます。",
    "この記事は「自動運転システムをエッジデバイスに組み込むための技術」を3回に分けて紹介するTURINGのテックブログ連載の第2回の記事「OpenCVをNPPにした結果→10倍高速に！」です。第1回の「C++でOpenCV完全入門！」、第3回の「詳解V4L2 (video for linux 2)」もぜひご覧ください！"
  ];

  List<String> _link = [
    "https://qiita.com/noshishi/items/60a6fe7c63097950911b",
    "https://zenn.dev/chillout2san/articles/4868c825158729",
    "https://qiita.com/kurun_pan/items/f9251b1827ce9dca9e14",
    "https://qiita.com/inajob/items/d04ef69eb43c4fba81d8",
    "https://zenn.dev/turing_motors/articles/14a6ea47794535",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: DataTable(
      dataRowHeight: 150,
      columns: [
        DataColumn(label: Container(width: 150, child: Text("題名"))),
        DataColumn(label: Text("本文")),
      ],
      rows: [
        for (var i = 0; i < _title.length; i++)
          DataRow(cells: [
            DataCell(Text(_title[i])),
            DataCell(Text(_description[i])),
          ]),
      ],
    )));
  }
}
