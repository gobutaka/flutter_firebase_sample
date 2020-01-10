import 'package:flutter_firebase_sample/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Pokemon>(
        create: (_) => Pokemon('hoge'),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CenterTextWidget(),
            CounterNumberWidget(),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        IncrementButtonWidget(),
      ]),
    );
  }
}

class CenterTextWidget extends StatelessWidget {
  const CenterTextWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('You have pushed the button this many times:');
  }
}

class CounterNumberWidget extends StatelessWidget {
  const CounterNumberWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context);
    return Text(
      '${pokemon.name}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class IncrementButtonWidget extends StatelessWidget {
  const IncrementButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pokemon = Provider.of<Pokemon>(context, listen: false);
    return FloatingActionButton(
      onPressed: () => pokemon.find(),
      tooltip: 'Find',
      child: Icon(Icons.add),
    );
  }
}
