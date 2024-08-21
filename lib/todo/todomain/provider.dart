import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo/modelclass.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add(Todo task) {
    state = [...state, task];
  }

  void delete(int index) {}
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
