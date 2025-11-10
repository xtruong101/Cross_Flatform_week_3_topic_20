
class Todo 
{
  final String title;
  final bool isDone;

  Todo({required this.title, this.isDone = false});
  Todo toggle() => Todo(title: title, isDone: !isDone);
}

class AppState 
{
  final List<Todo> todos;
  AppState({required this.todos});
  factory AppState.initial() => AppState(todos: []);
  AppState copyWith({List<Todo>? todos}) {
    return AppState(todos: todos ?? this.todos);
  }
}









// class AppState 
//{
//   final int counter;

//   AppState({required this.counter});
//   factory AppState.initial() => AppState(counter: 0);

//   AppState copyWith({int? counter}) {
//     return AppState(counter: counter ?? this.counter);
//   }
// }
