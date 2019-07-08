
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/Counter.dart';

class Page1 extends StatelessWidget {
  Page1({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page 1 - recover number of times the button was pushed:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 
            Navigator.of(context).pop(),
        child: Icon(Icons.home),
      ),
      );
  }
}