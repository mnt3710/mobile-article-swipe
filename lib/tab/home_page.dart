import "package:flutter/cupertino.dart";
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(content: Text(_names[i])));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoTabView(
      builder: (BuildContext context) {
        return SwipeCards(
          matchEngine: _matchEngine!,
          onStackFinished: () => Text('ok'),
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Container(
              width: 100,
              height: 100,
              color: Color(0xFFEFEFF4),
              child: Icon(CupertinoIcons.news),
            ));
          },
        );
      },
    ));
  }
}
