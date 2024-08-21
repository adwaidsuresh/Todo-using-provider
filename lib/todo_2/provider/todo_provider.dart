import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo_2/modelclass/model.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void add(TodoModel todo) {
    state = [...state, todo];
  }

  void delete(int index) {
    state = List.from(state)..removeAt(index);
  }

  void edit(int index, TodoModel newtodo) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) newtodo else (state[i])
    ];
  }
}

final todostateProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});





















// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_main/todo_2/modelclass/model.dart';

// class TodoNotifier extends StateNotifier<List<TodoModel>> {
//   TodoNotifier() : super([]);

//   void add(TodoModel todo) {
//     state = [...state, todo];
//   }

//   void delete(int index) {
//     state = List.from(state)..removeAt(index);
//   }

  // void edit(int index, TodoModel newtodo) {
  //   state = [
  //     for (int i = 0; i < state.length; i++)
  //       if (i == index) newtodo else (state[i])
  //   ];
  // }
// }

// final todoprovider =
//     StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
//   return TodoNotifier();
// });
