// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_main/todo/provider.dart';
import 'package:todo_main/todo_2/modelclass/model.dart';
import 'package:todo_main/todo_2/provider/todo_provider.dart';

class SamView extends ConsumerWidget {
  const SamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TodoModel> todoitem = ref.watch(todostateProvider);
    final TextEditingController word = TextEditingController();
    final TextEditingController edit = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoitem.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(todoitem[index].title!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(todostateProvider.notifier)
                                  .delete(index);
                            },
                            icon: Icon(CupertinoIcons.delete),
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
                                          final editdata = edit.text.trim();
                                          if (editdata.isNotEmpty) {
                                            ref
                                                .watch(
                                                    todostateProvider.notifier)
                                                .edit(index,
                                                    TodoModel(title: editdata));
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Text('ok'),
                                      )
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit))
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextField(
                  controller: word,
                ),
                TextButton(
                  onPressed: () {
                    final data = word.text.trim();
                    if (data.isNotEmpty) {
                      ref
                          .watch(todostateProvider.notifier)
                          .add(TodoModel(title: data));
                    }
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
