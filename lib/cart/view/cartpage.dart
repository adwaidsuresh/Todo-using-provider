// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/cart/provider/new_provider.dart';

class Cartpage extends ConsumerWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final cart=ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          return Container(
            width: 250,
            height: 150,
            color: const Color.fromARGB(255, 244, 130, 130),
            child: Column(
              children: [
                Text(item.name),
                Text(item.price.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
