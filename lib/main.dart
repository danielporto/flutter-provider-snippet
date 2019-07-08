import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_snippet/constants.dart';
import 'package:flutter_provider_snippet/routes.dart';
import 'package:flutter_provider_snippet/blocs/Counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: Router.generateRoute,
        initialRoute: homeRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
      builder: (_) => Counter(0),
    );
  }
}
