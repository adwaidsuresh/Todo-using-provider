import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo_2/modelclass/model.dart';
import 'package:todo_main/todo_2/provider/todo_provider.dart';

class Egtodo extends ConsumerWidget {
  const Egtodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController text = TextEditingController();
    final TextEditingController edit = TextEditingController();
    final List<TodoModel> todolist = ref.watch(todostateProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todolist.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                        title: Text(todolist[index].title!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(todostateProvider.notifier)
                                    .delete(index);
                              },
                              icon: const Icon(CupertinoIcons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextField(
                                        controller: edit,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            final editText = edit.text.trim();
                                            if (editText.isNotEmpty) {
                                              ref
                                                  .watch(todostateProvider
                                                      .notifier)
                                                  .edit(
                                                    index,
                                                    TodoModel(title: editText),
                                                  );
                                            }
                                          },
                                          child: Text('ok'))
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        leading: Text('$index'))
                  ],
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      TextField(
                        controller: text,
                      ),
                      TextButton(
                          onPressed: () {
                            final todo = text.text.trim();
                            if (todo.isNotEmpty) {
                              return ref
                                  .read(todostateProvider.notifier)
                                  .add(TodoModel(title: todo));
                            }
                          },
                          child: const Text('ok'))
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
