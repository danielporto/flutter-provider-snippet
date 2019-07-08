

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_snippet/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_snippet/blocs/Counter.dart';

class HomePage extends StatelessWidget {
  final String title;
  
  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btxInc',
            onPressed: _counter.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'btxDec',
            onPressed: _counter.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            heroTag: 'btxP1',
            onPressed: () => Navigator.pushNamed(context, page1Route),
            tooltip: 'Go to Page 1',
            child: Icon(Icons.archive),
            backgroundColor: Colors.green,
          ),
          FloatingActionButton(
            heroTag: 'btxP2',
            onPressed: () => Navigator.pushNamed(context, page2Route),
            tooltip: 'Go to Page 2',
            child: Icon(Icons.archive),
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}