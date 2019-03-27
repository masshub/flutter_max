import 'dart:async';

import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        builder: (context, snapshot) {
          return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
                _counterBloc.counter.add(1);
//            _counterBloc.log();
              });
        },
        initialData: 0,
        stream: _counterBloc.count,
      ),
    );
  }
}

class CounterFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      onPressed: () {
        _counterBloc.counter.add(1);
//        _counterBloc.log();
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void disPose() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({this.child, this.bloc}) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
