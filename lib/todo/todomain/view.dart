import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/todo/modelclass.dart';
import 'package:todo_main/todo/provider.dart';

class Mainview extends ConsumerWidget {
  const Mainview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (ctx, watch, child) {
          final List<Todo> todolist = ref.watch(todoListProvider);
          return ListView.separated(
            itemCount: todolist.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todolist[index].title),
              leading: const Icon(Icons.edit),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.black,
                  )),
            ),
            separatorBuilder: (context, index) => const SizedBox(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final TextEditingController controller = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextField(
                  controller: controller,
                ),
                TextButton(
                  onPressed: () {
                    final title = controller.text.trim();
                    if (title.isNotEmpty) {
                      return ref
                          .watch(todoListProvider.notifier)
                          .add(Todo(title));
                    }
                  },
                  child: const Text('ok'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
