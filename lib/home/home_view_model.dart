import 'package:rebloc/rebloc.dart';

import 'home.dart';

final homeStore = Store<HomeModel>(
    initialState: HomeModel.initialState(), blocs: [HomeSimpleBloc()]);

class HomeSimpleBloc extends SimpleBloc<HomeModel> {
  @override
  HomeModel reducer(model, action) {
    if (action is HomeAction) {
      int counter = action.counter;
      HomeModel model = HomeModel().provideHomeViewState(counter: counter);
      return model;
    }
    return model;
  }
}
