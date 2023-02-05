import "package:flutter/material.dart";
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  List<String> _title = [
    "tsの歴史",
    "chatGPTについて",
    "スクレイピングのやり方",
    "Flutterの利点",
    "Kotolin最強",
    "Vimmer",
    "Purple",
    "Pink"
  ];

  List<String> _description = [
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
    "tsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kますtsはjavascriptトニ亭kます",
  ];

  @override
  void initState() {
    for (int i = 0; i < _title.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(title: _title[i], description: _description[i])));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SwipeCards(
      matchEngine: _matchEngine!,
      onStackFinished: () => Text('ok'),
      itemBuilder: (BuildContext context, int index) {
        return Center(
            child: Container(
          margin: EdgeInsets.all(70),
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26, width: 2)),
          child: Center(
              child: Column(
            children: [
              SizedBox(height: 20),
              Text(_swipeItems[index].content.title,
                  style: TextStyle(fontSize: 28)),
              SizedBox(height: 20),
              Text(_swipeItems[index].content.description)
            ],
          )),
        ));
      },
    ));
  }
}

class Content {
  final String title;
  final String description;

  Content({required this.title, required this.description});
}
