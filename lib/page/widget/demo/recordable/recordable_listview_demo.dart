import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/28.
 * Describe:
 */

class RecordableListViewDemo extends StatefulWidget {
  @override
  _RecordableListViewDemoState createState() => _RecordableListViewDemoState();
}

class _RecordableListViewDemoState extends State<RecordableListViewDemo> {
  List<String> names = [
    "LeBron James",
    "Kevin Durant",
    "Anthony Davis",
    "James Harden",
    "Stephen Curry",
    "Giannis Antetokounmopo",
    "Joel Embiid",
    "Russell Westbrook",
    "Paul George",
    "Kawhi Leonard",
    "Jeremy Shuhow Lin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
          header: PreferredSize(
              child: AppBar(
                title: Text('RecordableListViewDemo'),
                centerTitle: true,
                elevation: 0.0,
              ),
              preferredSize: Size.fromHeight(24)),
          children: names.map((name) => _buildCard(name)).toList(),
          onReorder: onChangePosition),
    );
  }

  Widget _buildCard(String name) {
    return SizedBox(
      key: ObjectKey(name),
      height: 100.0,
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 6.0,
        child: Center(
          child: Text(
            "$name",
            style: TextStyle(fontSize: 26.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  onChangePosition(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex = newIndex - 1;
    var name = names.removeAt(oldIndex);
    names.insert(newIndex, name);
    setState(() {

    });
  }
}
