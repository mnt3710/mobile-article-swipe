import "package:flutter/material.dart";
import 'package:swipe_cards/swipe_cards.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/view_model/provider.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  List<String> _title = [];
  List<String> _content = [];

  fetchList() async {
    final _dio = Dio();
    const _url =
        'https://api.airtable.com/v0/appV6a4AhDb5naJCa/ariticle?api_key=keyrmU6zPEdCXGPXv';
    var _response = await _dio.get(_url);

    try {
      final _data = _response.data["records"];
      setState(() {
        for (var i = 0; i < _data.length; i++) {
          _title.add(_data[i]["fields"]["title"]);
          _content.add(_data[i]["fields"]["content"]);
        }
      });
    } catch (e) {
      print(e);
    }
    ;
  }

  @override
  void initState() {
    for (int i = 0; i < _title.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(title: _title[i], description: _content[i])));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(listProvider);
    return Center(
        child: asyncValue.when(
      child: Column(children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () => fetchList()),
            SizedBox(width: 15)
          ],
        ),
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
        const SizedBox(height: 50)
      ]),
    ));
  }
}

Widget CardContent(List items, int index) {
  return Center(
      child: Container(
    margin: EdgeInsets.all(30),
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
        SizedBox(height: 20),
        Text(items[index].content.title,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'YakuHanJPs')),
        SizedBox(height: 20),
        Text(items[index].content.description),
      ],
    )),
  ));
}

class Content {
  final String title;
  final String description;

  Content({required this.title, required this.description});
}
