import 'package:rebloc/rebloc.dart';

class HomeModel {
  String unit = "times";
  int counter;

  HomeModel({int counter});

  HomeModel.initialState() : counter = 0;

  HomeModel provideHomeViewState({int counter}) => this..counter = counter;
}

class HomeViewState extends HomeModel {
  int counter;
  String result;

  HomeViewState(this.counter, this.result);
}

class HomeAction extends Action {
  final int counter;

  HomeAction(this.counter);
}
