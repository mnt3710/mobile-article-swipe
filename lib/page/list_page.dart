import "package:flutter/material.dart";

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPage createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: DataTable(
      columns: [
        DataColumn(label: Text("題名")),
        DataColumn(label: Text("説明")),
      ],
      rows: [
        DataRow(cells: [DataCell(Text("ホゲホゲ")), DataCell(Text('ホゲホゲ'))])
      ],
    )));
  }
}
