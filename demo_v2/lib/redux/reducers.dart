import 'actions.dart';

class AppState {
  final List<int> history;
  final int currentIndex;

  AppState(this.history, this.currentIndex);

  AppState.initial() : history = [], currentIndex = -1;

  AppState copyWith({List<int>? history, int? currentIndex}) {
    return AppState(
      history ?? this.history,
      currentIndex ?? this.currentIndex,
    );
  }
}

AppState appReducer(AppState state, dynamic action) {
  if (action is UpdateStateAction) {
    final newHistory = state.history.sublist(0, state.currentIndex + 1);
    newHistory.add(action.value);
    return state.copyWith(
      history: newHistory,
      currentIndex: newHistory.length - 1,
    );
  }

  if (action is TravelToStateAction) {
    if (action.index >= 0 && action.index < state.history.length) {
      return state.copyWith(currentIndex: action.index);
    }
  }

  return state;
}