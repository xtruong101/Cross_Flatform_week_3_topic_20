import 'package:redux/redux.dart';
import 'actions.dart';
import 'reducers.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
);