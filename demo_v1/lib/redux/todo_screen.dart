// lib/screens/todo_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/state.dart';
import '../redux/actions.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Todo Redux App")),
      body: Column(
        children: [
          Expanded(
            child: StoreConnector<AppState, List<Todo>>(
              converter: (store) => store.state.todos,
              builder: (context, todos) {
                if (todos.isEmpty) {
                  return const Center(child: Text("ADD YOUR TASKS !!!"));
                }
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Icon(
                        todo.isDone ? Icons.check_circle : Icons.circle_outlined,
                        color: todo.isDone ? Colors.green : Colors.grey,
                      ),
                      onTap: () => StoreProvider.of<AppState>(context)
                          .dispatch(ToggleTodoAction(index)),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreBuilder<AppState>(
              builder: (context, store) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: "New task",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          store.dispatch(AddTodoAction(controller.text));
                          controller.clear();
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
