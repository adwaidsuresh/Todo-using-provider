import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo/modelclass.dart';

// Define a state notifier class for managing the todo list
class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  // Method to add a new todo to the list
  void add(Todo todo) {
    state = [...state, todo];
  }
}

// Create a provider for the todo list using StateNotifierProvider
final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList();
});
