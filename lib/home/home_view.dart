import 'package:flutter/material.dart';
import 'package:rebloc/rebloc.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this._title);

  final String _title;

  @override
  Widget build(BuildContext context) =>
      StoreProvider<HomeModel>(store: homeStore, child: _BodyWidget(_title));
}

class _BodyWidget extends StatelessWidget {
  _BodyWidget(this._title);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return ViewModelSubscriber<HomeModel, HomeViewState>(
        converter: buildConverter,
        builder: (context, dispatcher, viewState) {
          return Scaffold(
              appBar: AppBar(title: Text(_title)),
              body: buildCenter(viewState, context),
              floatingActionButton:
                  buildFloatingActionButton(dispatcher, viewState));
        });
  }

  HomeViewState buildConverter(model) {
    int counter = model.counter;
    String result = '${model.counter} ${model.unit}';
    return HomeViewState(counter, result);
  }

  Center buildCenter(HomeViewState viewState, BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text('You have pushed the button this many times:'),
          Text('${viewState.result}',
              style: Theme.of(context).textTheme.headline4)
        ]));
  }

  FloatingActionButton buildFloatingActionButton(
      DispatchFunction dispatcher, HomeViewState viewState) {
    return FloatingActionButton(
        onPressed: () => dispatcher(HomeAction(viewState.counter + 1)),
        tooltip: 'Increment',
        child: Icon(Icons.add));
  }
}
