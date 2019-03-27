import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/bloc/bloc_counter_home.dart';

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child:Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: CounterHome(),
        floatingActionButton: CounterFloatActionButton(),
      ) ,
    );
  }
}
