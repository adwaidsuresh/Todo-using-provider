import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo/modelclass.dart';
import 'package:todo_main/todo/provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final List<Todo> todoList = ref.watch(todoListProvider);

          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].title),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to add a new todo
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController controller = TextEditingController();

              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter Todo'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final title = controller.text.trim();
                      if (title.isNotEmpty) {
                        // Add the new todo to the list
                        ref.read(todoListProvider.notifier).add(Todo(title));
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
