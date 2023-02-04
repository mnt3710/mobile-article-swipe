import 'package:flutter/cupertino.dart';
import 'package:swipe_cards/swipe_cards.dart';
import './tab/home_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news), label: "article"),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
                child: SwipeCards(
              matchEngine: _matchEngine!,
              onStackFinished: () => Text('ok'),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(300),
                  width: 100,
                  height: 100,
                  color: Color(0xFFEFEFF4),
                  child: Icon(CupertinoIcons.news),
                );
              },
            ));
          },
        );
      },
    );
  }
}
