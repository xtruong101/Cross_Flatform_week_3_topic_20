
// lib/redux/reducer.dart
import 'package:redux/redux.dart';
import 'state.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) 
{
  if (action is AddTodoAction) {
    final newTodo = Todo(title: action.title);
    return state.copyWith(todos: [...state.todos, newTodo]);
  } else if (action is ToggleTodoAction) {
    final updated = state.todos
        .asMap()
        .entries
        .map((e) => e.key == action.index ? e.value.toggle() : e.value)
        .toList();
    return state.copyWith(todos: updated);
  }

  return state;
}













// import 'package:flutter_redux/flutter_redux.dart';
// import 'state.dart';
// import 'actions.dart';

// AppState appReducer(AppState state, dynamic action) {
//   if (action is IncrementAction) {
//     return state.copyWith(counter: state.counter + 1);
//   } else if (action is DecrementAction) {
//     return state.copyWith(counter: state.counter - 1);
//   } else if (action is ResetAction) {
//     return state.copyWith(counter: 0);
//   }
//   return state; // nếu action không khớp
// }
